# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

locals {
  environment_mapping = {
    development = "dev"
    testing     = "test"
    staging     = "stag"
    production  = "prod"
  }

  # Get the shortened environment name
  short_env = lookup(local.environment_mapping, var.environment, "unknown")
}

# Global resource group
# (pending)

# Application resource group
module "app" {
  source = "./modules/app"

  project_name        = var.project_name
  resource_group_name = var.resource_group_name
  environment         = var.environment
  location            = var.location
  location_short      = var.location_short
}

# Database resource group
module "database" {
  source = "./modules/db"

  # Common
  resource_group_name = var.resource_group_name_db
  environment         = var.environment
  location            = var.location
  location_short      = var.location_short

  # Cosmos DB specific
  cosmos_account_name  = var.cosmos_account_name
  nosql_database_name  = var.nosql_database_name
  nosql_container_name = var.nosql_container_name
}

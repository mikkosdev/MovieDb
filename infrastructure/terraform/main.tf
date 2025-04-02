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

# Main resource group
module "main" {
  source = "./modules/main"

  project_name        = var.project_name
  resource_group_name = var.resource_group_name
  environment         = var.environment
  location            = var.location
}

# Database resource group
module "database" {
  source = "./modules/database"

  # Common
  resource_group_name = var.resource_group_name_db
  environment         = var.environment
  location            = var.location

  # Cosmos DB specific
  cosmos_account_name  = var.cosmos_account_name
  nosql_database_name  = var.nosql_database_name
  nosql_container_name = var.nosql_container_name
}

# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "~> 3.0"
#     }
#   }
#   required_version = ">= 1.0"
# }

# provider "azurerm" {
#   features {}
# }

# Resource Group (Optional: only if you want to create it within this module)
resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
}

# Cosmos DB account for NoSQL
resource "azurerm_cosmosdb_account" "this" {
  name                = var.cosmos_account_name
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = var.cosmos_db_offer_type
  kind                = var.cosmos_db_kind
  enable_free_tier    = var.enable_free_tier

  consistency_policy {
    consistency_level = var.account_consistency_level
  }

  # Single-region write, single geo_location
  geo_location {
    location          = var.location
    failover_priority = 0
  }
}

# Cosmos DB NoSQL Database
# Note: The Terraform resource is named 'azurerm_cosmosdb_sql_database' 
# because "Core (SQL) API" is used for the NoSQL model in Azure Cosmos DB.
resource "azurerm_cosmosdb_sql_database" "this" {
  name                = var.nosql_database_name
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.this.name
  throughput          = var.throughput
}

# Cosmos DB NoSQL Container
resource "azurerm_cosmosdb_sql_container" "this" {
  name                = var.nosql_container_name
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.this.name
  database_name       = azurerm_cosmosdb_sql_database.this.name

  # Example partition key path
  partition_key_path = "/id"

  throughput = var.throughput
}

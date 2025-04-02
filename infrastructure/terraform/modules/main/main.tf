# Configure the Azure provider
# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "~> 3.0.2"
#     }
#   }

#   required_version = ">= 1.1.0"
# }

# provider "azurerm" {
#   features {}
# }

# Resource Group
resource "azurerm_resource_group" "rg" {
  tags     = var.tags
  name     = var.resource_group_name
  location = "northeurope"
}

# Virtual Network
resource "azurerm_virtual_network" "vnet" {
  tags                = var.tags
  name                = format("vnet-%s-%s-%s", var.project_name, var.environment, var.location)
  address_space       = ["10.0.0.0/16"]
  location            = "northeurope"
  resource_group_name = azurerm_resource_group.rg.name
}

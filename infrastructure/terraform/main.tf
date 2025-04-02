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

resource "azurerm_resource_group" "rg" {
  #   tags = {
  #     environment = "development"
  #   }
  name     = "rg-moviedb-dev-ne"
  location = "ne" # North Europe
}

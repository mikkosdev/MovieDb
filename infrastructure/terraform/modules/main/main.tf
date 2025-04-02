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

# Azure Container Registry
resource "azurerm_container_registry" "acr" {
  name                = format("acr%s%s%s", var.project_name, var.environment, var.location)
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}
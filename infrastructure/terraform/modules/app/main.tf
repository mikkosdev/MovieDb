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
  name                = format("acr%s%s%s", var.project_name, var.environment, var.location_short)
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}

# Azure Kubernetes Service
resource "azurerm_kubernetes_cluster" "aks" {
  tags = var.tags

  name                = format("aks-%s-%s-%s", var.project_name, var.environment, var.location_short)
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "myaks"

  # System node pool - must have more than 2 cores.
  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B4ms"
  }

  identity {
    type = "SystemAssigned"
  }
  
  sku_tier = "Free" # Options: Free or Paid
}

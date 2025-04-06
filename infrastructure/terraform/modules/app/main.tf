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
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  dns_prefix          = "myaks"
  sku_tier            = "Free"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }
}

# This links the AKS with ACR using a role assignment
resource "azurerm_role_assignment" "aks_acr_role" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}

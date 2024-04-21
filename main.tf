provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "aks" {
  name     = "myaks-rg"
  location = "North Europe"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "myaks"
  location            = "North Europe"
  resource_group_name = azurerm_resource_group.aks.name
}

default_node_pool {
  name       = "agentpool"
  node_count = 1
  vm_size    = "Standard_DS2_v2"
}


identity {
  type = "SystemAssigned"
}

provider "azurerm" {
  features {}

}

resource "azurerm_resource_group" "aks" {
  name     = "myaks-rg"
  location = "North Europe"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "myakscluster"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = "myaksdns"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}


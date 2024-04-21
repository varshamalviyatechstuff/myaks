provider "azurerm" {
  features {}
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "myaks"
  location            = "North Europe"
  resource_group_name = azurerm_resource_group.aks.name
  ...
}

resource "azurerm_resource_group" "aks" {
  name     = "myaks-rg"
  location = "North Europe"
}

provider "azurerm" {
  features {
    
  }
}

terraform {
 backend "azurerm" {
        resource_group_name = "importantgroup"    
        storage_account_name = "straccount836805"
        container_name = "newfiletfstate"
        key = "terraform.tfstate"
    }
}

data "azurerm_resource_group" "example" {
  name = "importantgroup"
}
resource "azurerm_virtual_network" "name" {
  name = "vnet10"
  location = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name
  address_space = ["10.0.0.0/16"]
}
resource "azurerm_subnet" "name" {
  name = "Subnet10"
  resource_group_name = data.azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.name.name
  address_prefixes = ["10.0.0.0/24"]
}
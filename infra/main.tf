terraform {
  //backend "azurerm" {}
}

provider "azurerm" {
  features {
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-bootcamp"
  location = "East US"
}
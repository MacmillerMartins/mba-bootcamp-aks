terraform {
  backend "azurerm" {
    resource_group_name  = "rg-bootcamp"
    storage_account_name = "sambabootcamp"
    container_name       = "scmbabootcamp"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-bootcamp"
  location = "East US"
}
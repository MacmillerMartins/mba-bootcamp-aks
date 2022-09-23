terraform {
  backend "azurerm" {
    resource_group_name  = "rg-bootcamp-tfstate"
    storage_account_name = "sambabootcamptfstate"
    container_name       = "scmbabootcamptfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {
  }
}
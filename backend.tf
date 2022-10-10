terraform {
  backend "azurerm" {
    resource_group_name  = "Karthik"
    storage_account_name = "store8909"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}

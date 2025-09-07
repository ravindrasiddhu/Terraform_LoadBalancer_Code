terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.43.0"
    }
  }

  # backend "azurerm" {
  #   # use_azuread_auth     = true
  #   # tenant_id            = "628588a9-979d-4f6a-ac82-bea62d285c23"
  #   resource_group_name  = "todo-app-rg"
  #   storage_account_name = "todoappstorage1"
  #   container_name       = "tfstate"
  #   key                  = "dev.terraform.tfstate"
  # } 

}

provider "azurerm" {
  features {}
  subscription_id = "18f8e7c5-a3db-4324-b49d-7ef07eace03f"
}
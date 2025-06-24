terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 3.75" # Enforce AzureRM provider version
    }
  }
  backend "azurerm" {
    resource_group_name  = "aniruddhastoragerg"       # Your existing resource group for the storage account
    storage_account_name = "aniruddhastorage01"       # Your existing storage account name
    container_name       = "tfstate"                  # Your existing container name for state files
    key                  = "multi-region-aks.tfstate" # Name of your state file blob
  }
}
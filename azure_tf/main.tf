#  Example `main.tf`:
# The configuration for the `remote` backend.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.108.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "tfstate"
      storage_account_name = "<storage_account_name>"
      container_name       = "tfstate"
      key                  = "terraform.tfstate"
  }

}

provider "azurerm" {
  features {}
  subscription_id   = AZURE_SUBSCRIPTION_ID
  tenant_id         = AZURE_TENANT_ID
  client_id         = AZURE_CLIENT_ID
  client_secret     = AZURE_AD_CLIENT_SECRET
}

resource "azurerm_resource_group" "state-demo-secure" {
  name     = "state-demo"
  location = "southeast asia"
}

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
      resource_group_name  = "pj-jinkee"
      storage_account_name = "pjjinkeesta"
      container_name       = "tfstate"
      key                  = "terraform.tfstate"
      use_oidc             = true
      client_id            = AZURE_CLIENT_ID
      tenant_id            = AZURE_TENANT_ID
      subscription_id      = AZURE_SUBSCRIPTION_ID
  }

}

provider "azurerm" {
  features {}
  use_oidc = true
#  subscription_id   = "${{ secrets.AZURE_SUBSCRIPTION_ID }}"
#  tenant_id         = "${{ secrets.AZURE_TENANT_ID }}"
#  client_id         = "${{ secrets.AZURE_CLIENT_ID }}"
#  client_secret     = "${{ secrets.AZURE_AD_CLIENT_SECRET }}"
}

resource "azurerm_resource_group" "state-demo-secure" {
  name     = "state-demo"
  location = "southeast asia"
}

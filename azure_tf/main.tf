#  Example `main.tf`:
# The configuration for the `remote` backend.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.108.0"
    }
  }

  # Update this block with the location of your terraform state file
  backend "azurerm" {
    resource_group_name  = "pj-jinkee"
    storage_account_name = "pjjinkeesta"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_oidc             = true
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}

resource "azurerm_resource_group" "state-demo-secure" {
  name     = "state-demo"
  location = "southeastasia"
}

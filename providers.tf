# --------------------------------------------------------
# Setup for Azure Provider from Terraform
# --------------------------------------------------------


terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.83.0"
    }
  }
}

provider "azurerm" {
  # Whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  tenant_id       = ""
  subscription_id = ""
  client_id       = ""
  client_secret   = ""

  features {}
}

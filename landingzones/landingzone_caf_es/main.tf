provider "azurerm" {
  features {}
}


terraform {
  backend "azurerm" {
  }
}

terraform {
  required_providers {
    azurecaf = {
      source = "aztfmod/azurecaf"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.31.1"
    }
  }
  required_version = ">= 0.13"
}


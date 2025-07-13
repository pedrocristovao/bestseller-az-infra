terraform {
    required_version = ">= 1.5.0"
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~> 4.36"
        }
    }
}

provider "azurerm" {
    features {}
}
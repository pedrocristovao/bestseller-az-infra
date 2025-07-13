terraform {
  backend "azurerm" {
    resource_group_name   = "rg-tfstate-backend_setup"
    storage_account_name  = "storagetfstateinfra"
    container_name        = "tfstate"
    key                   = "prod.terraform.tfstate"
    use_azuread_auth = true
  }
}

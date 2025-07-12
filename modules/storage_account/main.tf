resource "azurerm_storage_account" "storage_account" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

resource "azurerm_storage_container" "function_container" {
  name                  = "function-code"
  storage_account_id = azurerm_storage_account.storage_account.id
  container_access_type = "private"
  
}
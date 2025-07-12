resource "azurerm_linux_function_app" "function_app" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id = var.service_plan_id
  storage_account_name = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  functions_extension_version = "~4"

  site_config {
    application_stack {
      python_version = "3.11"
    }
  }

    identity {
        type = "SystemAssigned"
    }

    app_settings = {
        "FUNCTIONS_WORKER_RUNTIME" = "python"
    }
}
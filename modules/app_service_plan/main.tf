
resource "azurerm_service_plan" "service_plan" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type = "Linux"
  sku_name = "Y1"

}
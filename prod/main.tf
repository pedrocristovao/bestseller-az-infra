# locals {
#     environment     = "prod"
#     location    = "West Europe"
# }

# module "rg" {
#     source  = "../modules/resource_group"

#     name    = "rg-hello-${local.environment}"
#     location = local.location
# }

# module "storage" {
#     source              = "../modules/storage_account"

#     name                = "storagehello${local.environment}"
#     resource_group_name = module.rg.name
#     location            = module.rg.location
# }

# module "app_plan" {
#     source              = "../modules/app_service_plan"

#     name                = "plan-hello-${local.environment}"
#     location            = local.location
#     resource_group_name = module.rg.name
#     os_type            = "Linux"
#     sku_name           = "Y1"
# }

# module "function_app" {
#     source                      = "../modules/function_app"

#     name                        = "func-hello-${local.environment}"
#     resource_group_name         = module.rg.name
#     location                    = module.rg.location
#     service_plan_id             = module.app_plan.id
#     storage_account_name        = module.storage.name
#     storage_account_access_key  = module.storage.primary_access_key
# }
variable "name" {
  description = "The name of the resource group."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the App Service Plan will be created."
  type        = string
}

variable "location" {
  description = "The Azure region where the resource group will be created."
  type        = string
}

variable "service_plan_id" {
  description = "The ID of the App Service Plan to be used by the Function App."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account to be used by the Function App."
  type        = string
}

variable "storage_account_access_key" {
  description = "The access key for the storage account to be used by the Function App."
  type        = string
}



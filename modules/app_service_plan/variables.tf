variable "name" {
  description = "The name of the resource."
}

variable "resource_group_name" {
  description = "The name of the resource group where the App Service Plan will be created."  
}

variable "location" {
  description = "The location where the resource will be created."
}

variable "os_type" {
  description = "The operating system type for the App Service Plan."
}

variable "sku_name" {
  description = "The SKU name for the App Service Plan."
}
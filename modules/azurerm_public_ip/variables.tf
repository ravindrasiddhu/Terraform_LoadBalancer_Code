variable "name_pip" {
  description = "The name of the public IP address."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the public IP address."
  type        = string
}

variable "location" {
  description = "The Azure region where the public IP address will be created."
  type        = string
}

variable "allocation_method" {
  description = "The allocation method for the public IP address. Can be 'Static' or 'Dynamic'."
  type        = string
}

variable "sku" {
  description = "The SKU of the Public IP address. Possible values are 'Basic' and 'Standard'."
  type        = string
}



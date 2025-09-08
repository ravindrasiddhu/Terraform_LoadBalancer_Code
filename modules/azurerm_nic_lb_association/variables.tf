variable "resource_group_name" {
  description = "The name of the resource group in which to create the Network Interface."
  type        = string
}

variable "nic_name" {
  description = "The name of the Network Interface."
  type        = string
}

variable "lb_name" {
  description = "The name of the Load Balancer."
  type        = string
}

variable "lbap_name" {
  description = "The name of the Load Balancer Backend Address Pool."
  type        = string
}

variable "ip_configuration_name" {
  description = "The name of the IP configuration to associate with the Load Balancer Backend Address Pool."
  type        = string
}

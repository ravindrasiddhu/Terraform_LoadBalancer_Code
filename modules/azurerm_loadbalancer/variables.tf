variable "public_ip_name" {
  description = "The name of the existing Public IP Address"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where the Public IP Address is located"
  type        = string
}

variable "backend_address_pool_name" {
  description = "The name of the Backend Address Pool"
  type        = string
  default     = "BackEndAddressPool"
}

variable "probe_name" {
  description = "The name of the Load Balancer Probe"
  type        = string
  default     = "ssh-running-probe"
}

variable "lb_rule_name" {
  description = "The name of the Load Balancer Rule"
  type        = string
  default     = "LBRule"
}

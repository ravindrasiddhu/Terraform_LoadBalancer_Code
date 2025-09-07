data "azurerm_subnet" "subnet_frontend" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}


# data "azurerm_public_ip" "pip_frontend" {
#   name                = var.azurerm_public_ip_frontend
#   resource_group_name = var.resource_group_name
# }
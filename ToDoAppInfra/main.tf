module "azurerm_resource_group" {
  source   = "../modules/azurerm_resource_group"
  name     = "rg_main_ravin"
  location = "centralindia"
}

module "azurerm_virtual_network" {
  depends_on          = [module.azurerm_resource_group]
  source              = "../modules/azurerm_virtual_network"
  vnet_name           = "vnet1"
  location            = "centralindia"
  resource_group_name = "rg_main_ravin"
  address_space       = ["10.0.0.0/16"]
}

module "azurerm_subnet" {
  depends_on           = [module.azurerm_virtual_network]
  source               = "../modules/azurerm_subnet"
  subnet_name          = "frontend_subnet"
  virtual_network_name = "vnet1"
  resource_group_name  = "rg_main_ravin"
  address_prefixes     = ["10.0.1.0/24"]
}

module "azurerm_public_ip" {
  depends_on          = [module.azurerm_resource_group, module.azurerm_virtual_network]
  source              = "../modules/azurerm_public_ip"
  name_pip            = "pip"
  location            = "centralindia"
  resource_group_name = "rg_main_ravin"
  allocation_method   = "Static"
  sku                 = "Standard"
}

module "frontend_vm1" {
  depends_on = [module.azurerm_virtual_network, ]
  source     = "../modules/azurerm_virtual_machine"

  resource_group_name  = "rg_main_ravin"
  location             = "centralindia"
  vm_name              = "frontend-vm1"
  vm_size              = "Standard_B1s"
  image_publisher      = "canonical"
  image_sku            = "minimal-20_04-lts"
  image_offer          = "0001-com-ubuntu-minimal-focal"
  nic_name             = "frontend-nic"
  subnet_name          = "frontend_subnet"
  virtual_network_name = "vnet1"
  admin_username       = "adminuser"
  admin_password       = "Password@123!"
}

module "frontend_vm2" {
  depends_on = [module.azurerm_virtual_network, ]
  source     = "../modules/azurerm_virtual_machine"

  resource_group_name  = "rg_main_ravin"
  location             = "centralindia"
  vm_name              = "frontend-vm2"
  vm_size              = "Standard_B1s"
  image_publisher      = "canonical"
  image_sku            = "minimal-20_04-lts"
  image_offer          = "0001-com-ubuntu-minimal-focal"
  nic_name             = "frontend-nic1"
  subnet_name          = "frontend_subnet"
  virtual_network_name = "vnet1"
  admin_username       = "adminuser"
  admin_password       = "Password@123!"
}


# lb, frontend_ip-config, probe, backend address pool, rule
module "name_azurerm_loadbalancer" {
  depends_on                = [module.azurerm_public_ip, module.frontend_vm1, module.frontend_vm2]
  source                    = "../modules/azurerm_loadbalancer"
  resource_group_name       = "rg_main_ravin"
  public_ip_name            = "pip"
  backend_address_pool_name = "BackEndAddressPool"
  probe_name                = "ssh-running-probe"
  lb_rule_name              = "LBRule"
}

# module "pinki2lb_jod_yojna" {
#   source                = "../modules/azurerm_nic_lb_association"
#   nic_name              = "frontend-nic"
#   resource_group_name   = "rg_main_ravin"
#   lb_name               = "TestLoadBalancer"
#   lbap_name             = "BackEndAddressPool"
#   ip_configuration_name = "internal"
# }

# module "chinki2lb_jod_yojna" {
#   source                = "../modules/azurerm_nic_lb_association"
#   nic_name              = "frontend-nic1"
#   resource_group_name   = "rg_main_ravin"
#   lb_name               = "TestLoadBalancer"
#   lbap_name             = "BackEndAddressPool"
#   ip_configuration_name = "internal"
# }

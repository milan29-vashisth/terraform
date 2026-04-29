resource "azurerm_resource_group" "rg" {
  name     = "rg-linux-${var.environment}"
  location = var.location
}

module "network" {
  source = "../modules/network"

  environment         = var.environment
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

module "vm" {
  source = "../modules/vm"

  environment         = var.environment
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = module.network.subnet_id

  vm_size        = var.vm_size
  admin_username = "azureuser"
  vm_password    = var.vm_password
}

module "keyvault" {
  source = "../modules/keyvault"

  environment         = var.environment
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
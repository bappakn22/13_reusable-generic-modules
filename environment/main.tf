module "rgs" {
  source = "../module/01_azurerm_resource_group"
  rg_names = var.rg_names
}

module "stgs" {
  depends_on = [ module.rgs ]
  source = "../module/02_azurerm_storage_account"
  stg_acconts = var.stg_details
}


module "networks" {
  depends_on = [ module.rgs ]
  source = "../module/03_azurerm_networking"
  vnets = var.env_vnets
}

module "p_ip"{
  depends_on = [ module.rgs ]
  source = "../module/04_azurerm_public_ip"
  pip_ip  = var.pub_ip
}


module "vm" {
  depends_on = [module.p_ip, module.networks, module.rgs  ]
source = "../module/05_azurerm_linux_vm"
vms = var.v_machine

}
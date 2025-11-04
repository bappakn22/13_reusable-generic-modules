
variable "vms" {
  type = map(object({
    nic_name                        = string
    location                        = string
    rg_name                         = string
    vm_name                         = string
    size                            = string
    disable_password_authentication = string
    subnet_name                     = string
    pip_name                        = string
    vnet_name                       = string
  }))
}

variable "rg_names" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string, "Terraform")
    tags       = optional(map(string))
  }))
}




variable "stg_details" {
  type = map(object({
    name                            = string
    resource_group_name             = string
    location                        = string
    account_tier                    = string
    account_replication_type        = string
    account_kind                    = optional(string)
    access_tier                     = optional(string)
    min_tls_version                 = optional(string)
    public_network_access_enabled   = optional(bool)
    default_to_oauth_authentication = optional(bool)
    tags                            = optional(map(string))
    net_rules = optional(map(object({
      default_action = string
      bypass         = optional(list(string))
      ip_rules       = optional(list(string))

    })))
  }))
}


variable "env_vnets" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = map(string)
    subnets = map(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
}


variable "pub_ip" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    tags                = map(string)
    sku                 = string
 
  }))
}

variable "v_machine" {
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


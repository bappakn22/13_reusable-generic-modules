variable "stg_acconts" {
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

resource "azurerm_storage_account" "my_stg" {
  for_each                        = var.stg_acconts
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  account_tier                    = each.value.account_tier
  account_replication_type        = each.value.account_replication_type
  account_kind                    = each.value.account_kind
  access_tier                     = each.value.access_tier
  min_tls_version                 = each.value.min_tls_version
  public_network_access_enabled   = each.value.public_network_access_enabled
  default_to_oauth_authentication = each.value.default_to_oauth_authentication

  dynamic "network_rules" {
    for_each = each.value.net_rules
    content {
      default_action = network_rules.value.default_action
      bypass         = network_rules.value.bypass
      ip_rules       = network_rules.value.ip_rules

    }
  }
}

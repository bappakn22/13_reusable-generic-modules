output "rg_id" {
    value = {for key, rg in azurerm_resource_group.my_rg : key =>rg.id}
}
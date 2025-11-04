resource "azurerm_resource_group" "my_rg" {
    for_each = var.rg_names
    name = each.value.name
    location = each.value.location
    managed_by = lookup(each.value,"managed_by", "Terraform")
    tags = lookup(each.value,"tags" , {})

}



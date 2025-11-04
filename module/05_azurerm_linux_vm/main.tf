resource "azurerm_network_interface" "nic" {
    for_each = var.vms
    name = each.value.nic_name
    location = each.value.location
    resource_group_name = each.value.rg_name

    ip_configuration {
      name = "internal"
      subnet_id = data.azurerm_subnet.subnet[each.key].id
      private_ip_address_allocation= "Dynamic"
      public_ip_address_id =data.azurerm_public_ip.pip[each.key].id
    }
}


resource "azurerm_linux_virtual_machine" "linux_vm" {
    for_each = var.vms
    name = each.value.vm_name
    resource_group_name = each.value.rg_name
    location = each.value.location
    size = each.value.size
    admin_username = "devopsadmin"
    admin_password = "devops@12345"
    network_interface_ids = [data.azurerm_network_interface.nic[each.key].id]
    disable_password_authentication = each.value.disable_password_authentication

    os_disk {
      caching = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}





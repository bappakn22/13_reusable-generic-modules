rg_names = {
  "rg1" = {
    name       = "mobile_rg"
    location   = "japan east"
    managed_by = "bappa"
    tags = {
      environment : "prod"
    }
  }
  "rg2" = {
    name     = "network_rg"
    location = "east us"

  }
}

stg_details = {
  "stg1" = {
    name                            = "mobdatabase"
    resource_group_name             = "mobile_rg"
    location                        = "japan east"
    account_tier                    = "Standard"
    account_replication_type        = "GRS"
    account_kind                    = "StorageV2"
    access_tier                     = "Hot"
    min_tls_version                 = "TLS1_2"
    public_network_access_enabled   = true
    default_to_oauth_authentication = false
    tags = {
      environment : "prod"
    }
    net_rules = {
      "net_rules1" = {
        default_action = "Allow"
        bypass         = ["None"]
        ip_rules       = ["122.177.197.98"]
      }

    }
  }
}

env_vnets = {
  vnet1 = {
    name                = "phonevnet"
    location            = "japan east"
    resource_group_name = "mobile_rg"
    address_space       = ["10.0.0.0/16"]
    subnets = {
      s1 = {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      }

      s2 = {
        name             = "backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    }


    tags = {
      environment = "Production"
    }
  }
}

pub_ip = {
  pip1 = {
    name                = "mobpip"
    resource_group_name = "mobile_rg"
    location            = "japan east"
    allocation_method   = "Static"
    sku                 = "Standard"
 
    tags = {
      env = "production"
    }
  }
  pip2 = {
    name                = "mobpip2"
    resource_group_name = "mobile_rg"
    location            = "japan east"
    allocation_method   = "Static"
    sku                 = "Standard"
    
    tags = {
      env = "production"
    }
  }
}

v_machine = {
  vm_details = {
    nic_name                        = "frontendnic"
    location                        = "japan east"
    vm_name                         = "frontend-vm"
    size                            = "Standard_F2"
    disable_password_authentication = "false"
    pip_name                        = "mobpip"
    rg_name                         = "mobile_rg"
    vnet_name                       = "phonevnet"
    subnet_name                     = "frontend-subnet"

  }
  vm_details2 = {
    nic_name                        = "backendnic"
    location                        = "japan east"
    vm_name                         = "backend-vm"
    size                            = "Standard_F2"
    disable_password_authentication = "false"
    pip_name                        = "mobpip2"
    rg_name                         = "mobile_rg"
    vnet_name                       = "phonevnet"
    subnet_name                     = "backend-subnet"

  }
}

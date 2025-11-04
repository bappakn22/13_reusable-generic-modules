variable "pip_ip" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    tags = map(string)
    sku = string
    
  }))
}

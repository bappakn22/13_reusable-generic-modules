variable "rg_names" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string,"Terraform")
    tags       = optional(map(string))
  }))
}



variable "key_vaults" {
  description = "Key Vaults and their properties."
  type = map(object({
    name                            = string
    location                        = string
    resource_group_name             = string
    sku_name                        = string
    tenant_id                       = string
    enabled_for_deployment          = bool
    enabled_for_disk_encryption     = bool
    enabled_for_template_deployment = bool
    enable_rbac_authorization       = bool
    purge_protection_enabled        = bool
    soft_delete_retention_days      = number
    tags                            = map(string)
  }))
  default = {}
}
# soft_delete_retention_days numeric value can be between 7 and 90. 90 is default

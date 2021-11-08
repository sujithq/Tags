key_vaults = {
  keyvault1 = {
    name                            = "kv-eastus2-01"
    location                        = "eastus2"
    resource_group_name             = "Terraform1"
    sku_name                        = "standard" # premium is other option
    tenant_id                       = "53"
    access_policy                   = null
    enabled_for_deployment          = true
    enabled_for_disk_encryption     = true
    enabled_for_template_deployment = true
    enable_rbac_authorization       = true
    purge_protection_enabled        = false
    soft_delete_retention_days      = 7 # ranges from 7 to 90 days. 90 is default
    tags = {
      iac    = "Terraform"
      syntax = "Test of new Syntax"
    }
  }
}

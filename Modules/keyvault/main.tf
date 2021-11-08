
data "azurerm_resource_group" "this" {
  for_each = var.key_vaults
  name     = each.value.resource_group_name #this is wrong
}

# -
# - Setup key vault 
# -

resource "azurerm_key_vault" "this" {
  for_each                        = var.key_vaults
  name                            = each.value["name"]
  location                        = each.value["location"]
  resource_group_name             = each.value["resource_group_name"]
  sku_name                        = each.value["sku_name"]
  tenant_id                       = each.value["tenant_id"]
  enabled_for_deployment          = each.value["enabled_for_deployment"]
  enabled_for_disk_encryption     = each.value["enabled_for_disk_encryption"]
  enabled_for_template_deployment = each.value["enabled_for_template_deployment"]
  enable_rbac_authorization       = each.value["enable_rbac_authorization"]
  purge_protection_enabled        = each.value["purge_protection_enabled"]
  soft_delete_retention_days      = each.value["soft_delete_retention_days"]
  tags                            = merge(each.value["tags"], data.azurerm_resource_group.this["${each.value.resource_group_name}"].tags)

}

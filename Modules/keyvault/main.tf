
data "azurerm_resource_group" "this" {
  # read from local variable, index is resource_group_name, defined at line 30
  for_each = local.rgs_map
  name     = each.value.name
}

# use data azurerm_client_config to get tenant_id, not from config 
data "azurerm_client_config" "current" {}

# -
# - Setup key vault 
# - Trying local mapping for RGs
/*
locals {
  rgs_map = {
    for n in data.azurerm_resource_group.this :
    n.name => {
      name     = n.name
      location = n.location
      tags     = n.tags
    }
  }
*/

# transform variables to locals to make sure the correct index will be used: resource group name and key vault name
locals {
  rgs_map = {
    for n in var.key_vaults :
    n.resource_group_name => {
      name     = n.resource_group_name
    }
  }
  kvs_map = {
    for n in var.key_vaults :
    n.name => {
      name                            = n.name
      location                        = n.location
      resource_group_name             = n.resource_group_name
      sku_name                        = n.sku_name
      tenant_id                       = data.azurerm_client_config.current.tenant_id# n.tenant_id
      enabled_for_deployment          = n.enabled_for_deployment
      enabled_for_disk_encryption     = n.enabled_for_disk_encryption
      enabled_for_template_deployment = n.enabled_for_template_deployment
      enable_rbac_authorization       = n.enable_rbac_authorization
      purge_protection_enabled        = n.purge_protection_enabled
      soft_delete_retention_days      = n.soft_delete_retention_days
      tags                            = merge(n.tags, data.azurerm_resource_group.this["${n.resource_group_name}"].tags)
    }
  }
}

resource "azurerm_key_vault" "this" {
  for_each                        = local.kvs_map # use local variable, other wise keyvault1 will be used in stead of kv-eastus2-01 as index
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

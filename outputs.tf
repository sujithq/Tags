# #############################################################################
# # OUTPUTS Resource Group
# #############################################################################

output "resource_group_ids_map" {
  value = module.resourceGroup.resource_group_ids_map
}

output "resource_group_locations_map" {
  value = module.resourceGroup.resource_group_locations_map
}

#Why do we need this? Becasue other modules merge their specific tags with these

output "resource_group_tags_map" {
  value = module.resourceGroup.resource_group_tags_map
}

# Added output from key vault module

output "key_vault_id" {
  value = module.keyvaults.key_vault_id
}

output "key_vault_name" {
  value = module.keyvaults.key_vault_name
}

output "key_vault_uri" {
  value = module.keyvaults.key_vault_uri
}

output "key_vault" {
 value = module.keyvaults.key_vault 
}

# #############################################################################
# # OUTPUTS VNets, Subnets, Peering
# #############################################################################

# #############################################################################
# # OUTPUTS Private DNS Zone
# #############################################################################


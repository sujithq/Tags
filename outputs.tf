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

# #############################################################################
# # OUTPUTS VNets, Subnets, Peering
# #############################################################################

# #############################################################################
# # OUTPUTS Private DNS Zone
# #############################################################################


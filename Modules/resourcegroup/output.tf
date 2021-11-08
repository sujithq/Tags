# #############################################################################
# # OUTPUTS Resource Group
# #############################################################################

output "resource_group_ids_map" {
  value       = { for r in azurerm_resource_group.this : r.name => r.id }
  description = "The Map of the Resource Group Id's."
}

output "resource_group_locations_map" {
  value       = { for r in azurerm_resource_group.this : r.name => r.location }
  description = "The Map of the Resource Group Locations."
}

#Why do we need this? Becasue other modules merge their specific tags with these

output "resource_group_tags_map" {
  value       = { for r in azurerm_resource_group.this : r.name => r.tags }
  description = "The Map of the Resource Group Tags."
}

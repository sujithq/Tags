# -
# - Create Resource Groups and assign tags
# - "this" reference comes from languages like Javascript where it means the current iteration of the object.
# - 
resource "azurerm_resource_group" "this" {
  for_each = var.resource_groups
  name     = each.value["name"]
  location = each.value["location"]
  tags     = each.value["tags"]
}
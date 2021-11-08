# use name as index
locals {
  rgs_map = {
    for n in var.resource_groups :
    n.name => {
      name     = n.name
      location = n.location
      tags     = n.tags
    }
  }
}

# -
# - Create Resource Groups and assign tags
# - "this" reference comes from languages like Javascript where it means the current iteration of the object.
# - 
resource "azurerm_resource_group" "this" {
  for_each = local.rgs_map # use local variable, other wise resource_group_1/resource_group_2 will be used in stead of Terraform1/Terraform2 as index
  name     = each.value.name
  location = each.value.location
  tags     = each.value.tags
}
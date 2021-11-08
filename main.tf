module "resourceGroup" {
  source          = "./Modules/resourcegroup"
  resource_groups = var.resource_groups
}

module "keyvaults" {
  source     = "./Modules/keyvault"
  key_vaults = var.key_vaults
}

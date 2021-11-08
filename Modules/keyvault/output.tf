# #############################################################################
# # OUTPUTS Key Vault
# #############################################################################

output "key_vault_id" {
  description = "The Id of each Key Vault"
  value       = { for k in azurerm_key_vault.this : k.name => k.id }
}

output "key_vault_name" {
  description = "The Name of each Key Vault"
  value       = { for k in azurerm_key_vault.this : k.name => k.name }
}

output "key_vault_uri" {
  description = "The URI of each Key Vault, used for performing operations on keys and secrets"
  value       = { for k in azurerm_key_vault.this : k.name => k.vault_uri }
}

output "key_vault" {
  description = "Key Vault details"
  value       = azurerm_key_vault.this
}

# At the moment only id and vault_uri are being exported for Key vault

# output "purge_protection" {
#   description = "Key Vault purge protection status"
#   value       = { for k in azurerm_key_vault.this : k.name => k.purge_protection }
# }

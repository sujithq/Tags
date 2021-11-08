
#############################################################################
# Provider Authentication
#############################################################################

# Terraform supports a number of different methods for authenticating to Azure.
# Reference: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret
# Below, we are using a service principal and client secret


variable "subscription_id" {
  description = "Azure subscription Id"
  default     = null
  type        = string
}

variable "tenant_id" {
  description = "Azure tenant Id"
  default     = null
  type        = string
}

variable "client_id" {
  description = "Azure service principal application Id"
  default     = null
  type        = string
}

variable "client_secret" {
  description = "Azure service principal application Secret"
  default     = null
  type        = string
}

# #############################################################################
# # Resource Group Variables
# #############################################################################
variable "resource_groups" {
  description = "Resource groups"
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
  default = {}
}

# #############################################################################
# # Key Vault Variables
# #############################################################################
variable "key_vaults" {
  description = "Key Vaults and their properties."
  type = map(object({
    name                            = string
    location                        = string
    resource_group_name             = string
    sku_name                        = string
    tenant_id                       = string
    enabled_for_deployment          = bool
    enabled_for_disk_encryption     = bool
    enabled_for_template_deployment = bool
    enable_rbac_authorization       = bool
    purge_protection_enabled        = bool
    soft_delete_retention_days      = number
    tags                            = map(string)
  }))
  default = {}
}

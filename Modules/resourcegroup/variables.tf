# -
# - Resource Group
# - https://www.terraform.io/docs/language/expressions/type-constraints.html#collection-types
variable "resource_groups" {
  description = "Resource groups"
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
  default = {}
}

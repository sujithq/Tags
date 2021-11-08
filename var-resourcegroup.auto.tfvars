resource_groups = {
  resource_group_1 = {
    name     = "Terraform1"
    location = "eastus2" //Azure Region to use
    tags = {
      created_by = "xxx.xxx"
      contact_dl = "xxx.xxx@xyz.com"
      env        = "dev"
    }
  },
  resource_group_2 = {
    name     = "Terraform2"
    location = "eastus2" //Azure Region to use
    tags = {
      created_by = "yyy.yyy"
      contact_dl = "yyy.yyy@xyz.com"
      env        = "nprd"
    }
  }
}

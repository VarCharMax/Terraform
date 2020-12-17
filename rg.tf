resource "azurerm_resource_group" "rg" {
  name     = "bookrg"
  location = var.location

  tags = {
    environment = "Terraform Azure"
  }
}


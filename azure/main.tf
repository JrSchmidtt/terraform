provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "terraform-rg"
  location = "brazilsouth"
  tags = {
    environment = "dev"
    date        = formatdate("DD/MM/YYYY", timestamp())
  }
}
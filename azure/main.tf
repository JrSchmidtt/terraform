provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "terraform-rg"
  location = "brazilsouth"
  tags = {
    environment = lower("Dev") # lower() function is used to convert the string to lowercase > dev.
    maintainer  = upper("Junior Schmidt") # upper() function is used to convert the string to uppercase > JUNIOR SCHMIDT.
    date        = formatdate("DD/MM/YYYY", timestamp()) # formatdate() function is used to format the date.
    technology  = title("terraform") # title() function is used to convert the string to titlecase > Terraform.
  }
}

variable "vnet-ip" {
  type = list(string)
  default = ["10.0.0.0/16"]
}
resource "azurerm_virtual_network" "vnet" {
  name                = "terraform-vnet"
  location            = azurerm_resource_group.rg.location == "" ? "brazilsouth" : azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = concat(var.vnet-ip, ["192.168.0.0/16"])
}

output "vnet" {
  value =  length(azurerm_virtual_network.vnet.address_space)
}
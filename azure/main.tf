provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "terraform-rg"
  location = "brazilsouth"
  tags = {
    environment = lower("Dev") # lower() function is used to convert the string to lowercase > dev.
    date        = formatdate("DD/MM/YYYY", timestamp()) # formatdate() function is used to format the date.
    technology  = title("terraform") # title() function is used to convert the string to titlecase > Terraform.
  }
}
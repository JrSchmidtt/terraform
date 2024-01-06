
resource "azurerm_resource_group" "rg-nsg" {
  name     = "terraform-rg"
  location = "brazilsouth"
}

resource "azurerm_network_security_group" "nsg" {
    name = "terraform-nsg"
    location = azurerm_resource_group.rg-nsg.location
    resource_group_name = azurerm_resource_group.rg-nsg.name
    depends_on = [azurerm_resource_group.rg-nsg]
}

variable "inbound-ports" {
    type = list(string)
    default = [
        101 = 80, // priority = port number
        102 = 443,
    ]
}

resource "azurerm_network_security_rule" "inbound-rules" {
    for_each = var.inbound-ports
    resource_group_name = azurerm_resource_group.rg-nsg.name
    network_security_group_name = azurerm_network_security_group.nsg.name
    name = "door-${each.value}"
    priority = each.key
    description = "Allow access to port ${each.value}"
    destination_port_range = each.value
    access = "Allow"
    direction = "Inbound"
    source_port_range = "*"
    protocol = "Tcp"
    source_address_prefix = "*"
}
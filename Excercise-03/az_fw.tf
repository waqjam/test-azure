resource "azurerm_resource_group" "fwrg1" {
  name     = "${var.prefix}-resources-${random_id.res_grp.hex}"
  location = "East US"
}


resource "azurerm_virtual_network" "fwvnet" {
  name                = "testvnet"
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.fwrg1.location
  resource_group_name = azurerm_resource_group.fwrg1.name
}

resource "azurerm_subnet" "fwsub" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.fwrg1.name
  virtual_network_name = azurerm_virtual_network.fwvnet.name
  address_prefixes     = ["10.1.4.0/24"]
}


resource "azurerm_public_ip" "fwip" {
  name                = "testfwpip"
  location            = azurerm_resource_group.fwrg1.location
  resource_group_name = azurerm_resource_group.fwrg1.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "azfw" {
  name                = "testfirewall"
  location            = azurerm_resource_group.fwrg1.location
  resource_group_name = azurerm_resource_group.fwrg1.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.fwsub.id
    public_ip_address_id = azurerm_public_ip.fwip.id
  }
}

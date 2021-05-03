resource "azurerm_virtual_network" "user30-vnet1" {
  name                = "user30-vnet1"
  address_space       = ["30.0.0.0/16"]
  location            = azurerm_resource_group.user30-rg1.location
  resource_group_name = azurerm_resource_group.user30-rg1.name
}


resource "azurerm_virtual_network" "user30-vnet2" {
  name                = "user30-vnet2"
  address_space       = ["130.0.0.0/16"]
  location            = azurerm_resource_group.user30-rg1.location
  resource_group_name = azurerm_resource_group.user30-rg1.name
}

resource "azurerm_virtual_network_peering" "peer1" {
  name                      = "peer1to2"
  resource_group_name       = azurerm_resource_group.user30-rg1.name
  virtual_network_name      = azurerm_virtual_network.user30-vnet1.name
  remote_virtual_network_id = azurerm_virtual_network.user30-vnet2.id
}

resource "azurerm_virtual_network_peering" "peer2" {
  name                      = "peer2to1"
  resource_group_name       = azurerm_resource_group.user30-rg1.name
  virtual_network_name      = azurerm_virtual_network.user30-vnet2.name
  remote_virtual_network_id = azurerm_virtual_network.user30-vnet1.id
}

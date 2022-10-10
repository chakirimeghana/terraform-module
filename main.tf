provider "azurerm" {
  features {}

  subscription_id = "52888c28-9d5b-4e7b-a4dd-a8723e6a8bb4"
  client_id       = "2bc71c53-6d7c-4e39-92bb-a43d3b2e3c6c"
  client_secret   = "OBW8Q~cJp-lXfUZEvejytYlHPFVvN1KLD4LWjbv."
  tenant_id       = "e73bcd2f-fec4-414d-bc64-4f37cd2d2b69"
}

resource "azurerm_resource_group" "dev-grp" {
  name     = var.azurerm_resource_group
  location = var.location
}

# Creating a VNET 
resource "azurerm_virtual_network" "vnet" {
  name                = var.azurerm_virtual_network
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.azurerm_resource_group

  depends_on = [
    azurerm_resource_group.dev-grp
  ]
}
# Creating a subnet 
resource "azurerm_subnet" "subnet" {
  name                 = var.azurerm_subnet
  resource_group_name  = var.azurerm_resource_group
  virtual_network_name = var.azurerm_virtual_network
  address_prefixes     = var.address_prefixes

      depends_on = [
        azurerm_virtual_network.vnet
      ]
}
# Creating a public-ip 
resource "azurerm_public_ip" "public-ip" {
  name                = var.azurerm_public_ip
  resource_group_name = var.azurerm_resource_group
  location            = var.location
  allocation_method   = var.allocation_method  
  sku = var.sku
 
    depends_on = [
      azurerm_subnet.subnet
    ]
}
# Creating a NSG
resource "azurerm_network_security_group" "example" {
  name                = var.azurerm_network_security_group
  location            = var.location
  resource_group_name = var.azurerm_resource_group

  security_rule {
    name                       = var.name
    priority                   = var. priority  
    direction                  = var.direction  
    access                     = var.access 
    protocol                   = var.protocol 
    source_port_range          = var.source_port_range   
    destination_port_range     = var.destination_port_range 
    source_address_prefix      = var.source_address_prefix 
    destination_address_prefix = var.destination_address_prefix
    }

    depends_on = [
      azurerm_resource_group.dev-grp
    ]
}

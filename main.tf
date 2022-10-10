provider "azurerm" {
  features {}

  subscription_id = "52888c28-9d5b-4e7b-a4dd-a8723e6a8bb4"
  client_id       = "2bc71c53-6d7c-4e39-92bb-a43d3b2e3c6c"
  client_secret   = "OBW8Q~cJp-lXfUZEvejytYlHPFVvN1KLD4LWjbv."
  tenant_id       = "e73bcd2f-fec4-414d-bc64-4f37cd2d2b69"
}

#Dev
module "Dev"{
  source="github.com/chakirimeghana/terraform-module"
azurerm_resource_group = "dev-grp"
location = "uksouth"
azurerm_virtual_network = "vnet"
address_space = ["10.0.0.0/16"]
azurerm_subnet="mysubnet"
address_prefixes=["10.0.0.0/24"]
azurerm_public_ip="Dev-pip"
allocation_method ="Dynamic"
sku="Basic"
azurerm_network_security_group="dev-nsg"
name="nsg1"
priority = 100
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = "*"
destination_port_range = "*"
source_address_prefix  = "*"
destination_address_prefix = "*"
}
#QA
module "QA"{
  source="github.com/chakirimeghana/terraform-module"
azurerm_resource_group = "QA-grp"
location = "uksouth"
azurerm_virtual_network = "vnet"
address_space = ["10.0.0.0/16"]
azurerm_subnet="mysubnet"
address_prefixes=["10.0.0.0/24"]
azurerm_public_ip="QA-pip"
allocation_method ="Dynamic"
sku="Basic"
azurerm_network_security_group="QA-nsg"
name="nsg1"
priority = 100
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = "*"
destination_port_range = "*"
source_address_prefix  = "*"
destination_address_prefix = "*"

}

#Prod
module "Prod"{
  source="github.com/chakirimeghana/terraform-module"
azurerm_resource_group = "Prod-grp"
location = "uksouth"
azurerm_virtual_network = "vnet"
address_space = ["10.0.0.0/16"]
azurerm_subnet="mysubnet"
address_prefixes=["10.0.0.0/24"]
azurerm_public_ip="Prod-pip"
allocation_method ="Dynamic"
sku="Basic"
azurerm_network_security_group="Prod-nsg"
name="nsg1"
priority = 100
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = "*"
destination_port_range = "*"
source_address_prefix  = "*"
destination_address_prefix = "*"

}
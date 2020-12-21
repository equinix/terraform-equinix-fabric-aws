provider "equinix" {
  client_id     = var.equinix_client_id
  client_secret = var.equinix_client_secret
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

data "equinix_ecx_port" "port" {
  name = var.equinix_port_name
}

module "aws-connection" {
  source         = "../../"
  name           = var.connection_name
  notifications  = var.notifications
  port_id        = data.equinix_ecx_port.port.id
  vlan_stag      = var.connection_vlan_stag
  vlan_ctag      = var.connection_vlan_ctag == 0 ? null : var.connection_vlan_ctag
  speed          = var.connection_speed
  speed_unit     = var.connection_speed_unit
  aws_metro_code = var.aws_metro_code
  aws_region     = var.aws_region
  aws_account_id = var.aws_account_id
  aws_access_key = var.aws_access_key
  aws_secret_key = var.aws_secret_key
}

resource "aws_dx_private_virtual_interface" "example" {
  connection_id    = module.aws-connection.aws_connection_id
  name             = var.connection_name
  vlan             = var.connection_vlan_stag
  address_family   = "ipv4"
  bgp_asn          = 64999
  amazon_address   = "169.254.0.1/30"
  customer_address = "169.254.0.2/30"
  bgp_auth_key     = "secret"
  vpn_gateway_id   = aws_vpn_gateway.example.id
}

resource "aws_vpc" "example" {
  cidr_block = "10.255.255.0/28"
}

resource "aws_vpn_gateway" "example" {
  vpc_id = aws_vpc.example.id
}

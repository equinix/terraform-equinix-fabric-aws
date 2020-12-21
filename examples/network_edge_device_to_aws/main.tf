provider "equinix" {
  client_id     = var.equinix_client_id
  client_secret = var.equinix_client_secret
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

data "equinix_network_account" "sv" {
  metro_code = var.device_metro_code
  status     = "Active"
}

data "equinix_network_device_type" "csr" {
  category    = "Router"
  vendor      = "Cisco"
  metro_codes = [data.equinix_network_account.sv.metro_code]
}

data "equinix_network_device_platform" "csr-small" {
  device_type = data.equinix_network_device_type.csr.code
  flavor      = "small"
}

data "equinix_network_device_software" "csr-latest" {
  device_type = data.equinix_network_device_type.csr.code
  packages    = [var.device_sw_package_code]
  most_recent = true
}

resource "equinix_network_device" "example" {
  name            = var.device_name
  throughput      = var.device_license_throughput
  throughput_unit = var.device_license_throughput_unit
  metro_code      = data.equinix_network_account.sv.metro_code
  type_code       = data.equinix_network_device_type.csr.code
  package_code    = var.device_sw_package_code
  notifications   = var.notifications
  hostname        = var.device_hostname
  term_length     = var.device_term_length
  account_number  = data.equinix_network_account.sv.number
  version         = data.equinix_network_device_software.csr-latest.version
  core_count      = data.equinix_network_device_platform.csr-small.core_count
}

module "aws-connection" {
  source         = "../../"
  name           = var.connection_name
  notifications  = var.notifications
  device_id      = equinix_network_device.example.id
  speed          = var.connection_speed
  speed_unit     = var.connection_speed_unit
  aws_metro_code = var.aws_metro_code
  aws_region     = var.aws_region
  aws_account_id = var.aws_account_id
  aws_access_key = var.aws_access_key
  aws_secret_key = var.aws_secret_key
}

resource "equinix_network_bgp" "example" {
  connection_id      = module.aws-connection.id
  local_ip_address   = var.bgp_ip_address
  local_asn          = var.asn_number
  remote_ip_address  = substr(var.aws_bgp_ip_address, 0, length(var.aws_bgp_ip_address) - 3) #remove preffix
  remote_asn         = var.aws_asn_number
  authentication_key = var.bgp_auth_key
}

resource "aws_dx_private_virtual_interface" "example" {
  connection_id    = module.aws-connection.aws_connection_id
  name             = var.connection_name
  vlan             = var.connection_vlan_stag
  address_family   = "ipv4"
  bgp_asn          = var.asn_number
  amazon_address   = var.aws_bgp_ip_address
  customer_address = var.bgp_ip_address
  bgp_auth_key     = var.bgp_auth_key
  vpn_gateway_id   = aws_vpn_gateway.example.id
}

resource "aws_vpc" "example" {
  cidr_block = var.aws_vpc_cidr
}

resource "aws_vpn_gateway" "example" {
  vpc_id          = aws_vpc.example.id
  amazon_side_asn = var.aws_asn_number
}


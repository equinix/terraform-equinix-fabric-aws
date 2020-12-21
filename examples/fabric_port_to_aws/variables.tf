variable "equinix_client_id" {
  description = "Equinix client ID (consumer key) from the app registered in Equinix Developer Portal"
}

variable "equinix_client_secret" {
  description = "Equinix client secret (consumer secret) from the app registered in Equinix Developer Portal"
}

variable "equinix_port_name" {
  description = "Name of the Equinix Fabric port to use on connection's originating side (a-zide)"
}

variable "connection_name" {
  description = "Connection name"
  default     = "example"
}

variable "connection_speed" {
  description = "Connection speed"
  default     = 1
}

variable "connection_speed_unit" {
  description = "Connection speed"
  default     = "GB"
}

variable "connection_vlan_stag" {
  description = "Connection vlan s-tag (outer tag)"
}

variable "connection_vlan_ctag" {
  description = "Connection vlan c-tag (inner tag)"
}

variable "notifications" {
  description = "List of email addresses that will receive notifications about the connection"
}

variable "aws_account_id" {
  description = "AWS account identifier"
}

variable "aws_access_key" {
  description = "AWS access key"
}

variable "aws_secret_key" {
  description = "AWS secret key"
}

variable "aws_metro_code" {
  description = "Equinix metro code of AWS Direct Connect location"
  default     = "SV"
}

variable "aws_region" {
  description = "AWS region for connection destination and AWS resources"
  default     = "us-west-1"
}

variable "aws_vpc_cidr" {
  description = "CIDR block for VPC that will be created and connected via VPN gateway"
  default     = "10.0.0.0/16"
}

variable "aws_asn_number" {
  description = "ASN number on the AWS side"
  default     = "65100"
}

variable "asn_number" {
  description = "ASN number on the customer side"
  default     = "65000"
}

variable "aws_bgp_ip_address" {
  description = "CIDR IPv4 address of a BGP peer on the AWS side"
  default     = "10.0.0.2/30"
}

variable "bgp_ip_address" {
  description = "CIDR IPv4 address of a BGP peer on the customer side"
  default     = "10.0.0.1/30"
}

variable "bgp_auth_key" {
  description = "Authentication key for BGP peering"
  default     = "secret"
}

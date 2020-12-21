variable "equinix_client_id" {
  description = "Equinix client ID (consumer key) from the app registered in Equinix Developer Portal"
}

variable "equinix_client_secret" {
  description = "Equinix client secret (consumer secret) from the app registered in Equinix Developer Portal"
}

variable "device_metro_code" {
  description = "Equinix Network Edge virtual device location's metro code"
  default     = "SV"
}

variable "device_name" {
  description = "Name of the Equinix Network Edge virtual device"
  default     = "example"
}

variable "device_license_throughput" {
  description = "Equinix Network Edge virtual device license throughput"
  default     = 500
}

variable "device_license_throughput_unit" {
  description = "Equinix Network Edge virtual device license throughput unit (Mbps or Gbps)"
  default     = "Mbps"
}

variable "device_sw_package_code" {
  description = "Equinix Network Edge virtual device software package code"
  default     = "IPBASE"
}

variable "device_hostname" {
  description = "Equinix Network Edge virtual device hostname prefix"
  default     = "example"
}

variable "device_term_length" {
  description = "Equinix Network Edge virtual device term length in months"
  default     = 1
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

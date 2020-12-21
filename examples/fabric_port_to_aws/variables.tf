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

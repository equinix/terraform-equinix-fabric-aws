variable "name" {
  description = "Connection name"
  type        = string
}

variable "purchase_order_number" {
  description = "Purchase order number to link with connection on the invoice"
  type        = string
  default     = ""
}

variable "notifications" {
  description = "List of email addresses that will receive notifications about connection"
  type        = list(string)
  validation {
    condition     = length(var.notifications) > 0
    error_message = "Notification list should contain at least one email address."
  }
}

variable "port_id" {
  description = "Equinix Fabric port identifier for connection source (a-side)"
  type        = string
  default     = ""
}

variable "vlan_stag" {
  description = "Connection vlan s-tag (outer tag)"
  type        = number
  default     = 0
}

variable "vlan_ctag" {
  description = "Vlan c-tag (inner tag)"
  type        = number
  default     = 0
}

variable "device_id" {
  description = "Equinix Network Edge virtual device identifier for connection source (a-side)"
  type        = string
  default     = ""
}

variable "device_interface_id" {
  description = "Equinix Network Edge virtual device interface identifier connection source (a-side)"
  type        = number
  default     = 0
}

variable "speed" {
  description = "Connection speed"
  type        = number
}

variable "speed_unit" {
  description = "Connection speed unit"
  type        = string
  validation {
    condition     = can(regex("^(MB|GB)$", var.speed_unit))
    error_message = "Speed unit should be either MB (for Mbps) or GB (for Gbps)."
  }
}

variable "aws_account_id" {
  description = "AWS account identifier"
  type        = string
}

variable "aws_access_key" {
  description = "AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
}

variable "aws_metro_code" {
  description = "Equinix metro code of AWS Direct Connect location"
  type        = string
  validation {
    condition     = can(regex("^[A-Z]{2}$", var.aws_metro_code))
    error_message = "Valid metro code consits of two capital letters, i.e. SV, DC."
  }
}

variable "aws_region" {
  description = "AWS Region associated with AWS Direct Connect location"
  type        = string
}

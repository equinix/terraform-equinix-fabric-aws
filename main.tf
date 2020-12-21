data "equinix_ecx_l2_sellerprofile" "this" {
  name = var.speed_unit == "GB" ? "AWS Direct Connect - High Capacity" : "AWS Direct Connect"
}

resource "equinix_ecx_l2_connection" "this" {
  name                  = var.name
  purchase_order_number = length(var.purchase_order_number) > 0 ? var.purchase_order_number : null
  profile_uuid          = data.equinix_ecx_l2_sellerprofile.this.id
  speed                 = var.speed
  speed_unit            = var.speed_unit
  notifications         = var.notifications
  port_uuid             = length(var.port_id) > 0 ? var.port_id : null
  device_uuid           = length(var.device_id) > 0 ? var.device_id : null
  device_interface_id   = var.device_interface_id == 0 ? null : var.device_interface_id
  vlan_stag             = var.vlan_stag == 0 ? null : var.vlan_stag
  vlan_ctag             = var.vlan_ctag == 0 ? null : var.vlan_ctag
  seller_region         = var.aws_region
  seller_metro_code     = var.aws_metro_code
  authorization_key     = var.aws_account_id
}

resource "equinix_ecx_l2_connection_accepter" "this" {
  connection_id = equinix_ecx_l2_connection.this.id
  access_key    = var.aws_access_key
  secret_key    = var.aws_secret_key
}

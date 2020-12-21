output "sp_name" {
  description = "Name of Equinix Fabric seller service profile used for a connection"
  value       = data.equinix_ecx_l2_sellerprofile.this.name
}

output "id" {
  description = "Connection identifier"
  value       = equinix_ecx_l2_connection.this.id
}

output "status" {
  description = "Connection provisioning status"
  value       = equinix_ecx_l2_connection.this.status
}

output "provider_status" {
  description = "Connection provider status"
  value       = equinix_ecx_l2_connection.this.provider_status
}

output "zside_port_id" {
  description = "Equinix Fabric port identifier on the z-side of the connection"
  value       = equinix_ecx_l2_connection.this.zside_port_uuid
}

output "zside_vlan_stag" {
  description = "Vlan s-tag (outer tag) on the z-side of the connection"
  value       = equinix_ecx_l2_connection.this.zside_vlan_stag
}

output "zside_vlan_ctag" {
  description = "Vlan c-tag (inner tag) on the z-side of the connection"
  value       = equinix_ecx_l2_connection.this.zside_vlan_ctag
}

output "aws_connection_id" {
  description = "The ID of the Direct Connect connection on AWS side"
  value       = equinix_ecx_l2_connection_accepter.this.aws_connection_id
}

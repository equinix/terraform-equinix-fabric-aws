output "sp_name" {
  description = "Name of Equinix Fabric seller service profile used for a connection"
  value       = module.aws-connection.sp_name
}

output "connection_id" {
  description = "Connection identifier"
  value       = module.aws-connection.id
}

output "aws_connection_id" {
  description = "The ID of the Direct Connect connection on AWS side"
  value       = module.aws-connection.aws_connection_id
}

output "aws_virtual_interface_id" {
  description = "The ID of the Direct Connect hosted private virtual interface"
  value       = aws_dx_private_virtual_interface.example.id
}

output "aws_vpc_id" {
  description = "The ID of the AWS VPC"
  value       = aws_vpc.example.id
}

output "aws_vpn_gateway_id" {
  description = "The ID of the AWS VPN gateway"
  value       = aws_vpn_gateway.example.id
}

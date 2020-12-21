# Equinix Fabric connection: virtual device to AWS virtual private interface

This example shows how to create layer2 connection between Equinix Network Edge
virtual device and AWS Direct Connect virtual private interface.

* creates small sized Cisco CSR 1000V virtual router in Equinix managed, license
subscription modes
* connects router interface via Equinix Fabric to AWS Direct Connect hosted connection
* creates AWS virtual private interface connected to VPN gateway within newly
created VPC
* creates BGP peering configuration on a router

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
|equinix_client_id|Equinix client ID (consumer key) from the app registered in Equinix Developer Portal|`string`|`""`|yes|
|equinix_client_secret|Equinix client secret (consumer secret) from the app registered in Equinix Developer Portal|`string`|`""`|yes|
|device_metro_code|Equinix Network Edge virtual device location's metro code|`string`|`"SV"`|no|
|device_name|Name of the Equinix Network Edge virtual device|`string`|`"example"`|no|
|device_license_throughput|Equinix Network Edge virtual device license throughput|`string`|`500`|no|
|device_license_throughput_unit|Equinix Network Edge virtual device license throughput unit (Mbps or Gbps)|`string`|`"Mbps"`|no|
|device_sw_package_code|Equinix Network Edge virtual device software package code|`string`|`"IPBASE"`|no|
|device_hostname|Equinix Network Edge virtual device hostname prefix|`string`|`"example"`|no|
|device_term_length|Equinix Network Edge virtual device hostname prefix|`number`|`1`|no|
|aws_account_id|AWS account identifier|`string`|`""`|yes|
|aws_access_key|AWS access key|`string`|`""`|yes|
|aws_secret_key|AWS secret key|`string`|`""`|yes|
|aws_metro_code|Equinix metro code of AWS Direct Connect location|`string`|`"SV"`|no|
|aws_region|AWS Region associated with AWS Direct Connect location|`string`|`"us-west-1"`|no|
|connection_name|Connection name|`string`|`"example"`|no|
|connection_speed|Connection speed|`number`|`1`|no|
|connection_speed_unit|Connection speed unit (`"GB"` or `"MB"`)|`string`|`"GB"`|no|
|notifications|List of email addresses that will receive notifications about the device and connection|`list(string)`|n/a|yes|
|aws_vpc_cidr|CIDR block for VPC that will be created and connected via VPN gateway|`string`|`"10.0.0.0/16"`|no|
|asn_number|ASN number on the customer side|`string`|`"65000"`|no|
|aws_asn_number|ASN number on the AWS side|`string`|`"65100"`|no|
|bgp_ip_address|CIDR IPv4 address of a BGP peer on the customer side|`string`|`"10.0.0.1/30"`|no|
|aws_bgp_ip_address|CIDR IPv4 address of a BGP peer on the AWS side|`string`|`"10.0.0.2/30"`|no|
|bgp_auth_key|Authentication key for BGP peering|`string`|`"secret"`|no|

## Outputs

| Name | Description |
|------|-------------|
|sp_name|Name of Equinix Fabric seller service profile used for a connection|
|id|Equinix Fabric connection identifier|
|aws_connection_id|AWS Direct Connect connection identifier|
|aws_virtual_interface_id|The ID of the Direct Connect hosted private virtual interface|
|aws_vpc_id|The ID of the AWS VPC|
|aws_vpn_gateway_id|The ID of the AWS VPN gateway|
|device_id|Network device identifier|
|device_ssh_ip_address|Network device SSH interface IP address|
|device_ssh_ip_fqdn|Network device SSH interface FQDN|
|device_interfaces|Network device interface list|
|bgp_state|BGP peering session state|

## Usage

1. Adjust variables
2. Initialize

   ```sh
   terraform init
   ```

3. Check plan

   ```sh
   terraform plan
   ```

4. Apply changes

   ```sh
   terraform apply
   ```

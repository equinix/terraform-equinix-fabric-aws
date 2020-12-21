# Equinix Fabric connection: port to AWS virtual private interface

This example shows how to create layer2 connection between Equinix Fabric port and
AWS Direct Connect virtual private interface.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
|equinix_client_id|Equinix client ID (consumer key) from the app registered in Equinix Developer Portal|`string`|`""`|yes|
|equinix_client_secret|Equinix client secret (consumer secret) from the app registered in Equinix Developer Portal|`string`|`""`|yes|
|equinix_port_name|Name of the Equinix Fabric port to use on connection's originating side (a-zide)|`string`|`""`|yes|
|aws_account_id|AWS account identifier|`string`|`""`|yes|
|aws_access_key|AWS access key|`string`|`""`|yes|
|aws_secret_key|AWS secret key|`string`|`""`|yes|
|aws_metro_code|Equinix metro code of AWS Direct Connect location|`string`|`"SV"`|no|
|aws_region|AWS Region associated with AWS Direct Connect location|`string`|`"us-west-1"`|no|
|connection_name|Connection name|`string`|`"example"`|no|
|connection_speed|Connection speed|`number`|`1`|no|
|connection_speed_unit|Connection speed unit (`"GB"` or `"MB"`)|`string`|`"GB"`|no|
|notifications|List of email addresses that will receive notifications about the connection|`list(string)`|n/a|yes|

## Outputs

| Name | Description |
|------|-------------|
|sp_name|Name of Equinix Fabric seller service profile used for a connection|
|id|Equinix Fabric connection identifier|
|aws_connection_id|AWS Direct Connect connection identifier|
|aws_virtual_interface_id|The ID of the Direct Connect hosted private virtual interface|
|aws_vpc_id|The ID of the AWS VPC|
|aws_vpn_gateway_id|The ID of the AWS VPN gateway|

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

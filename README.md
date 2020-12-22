# Equinix Fabric connection: AWS Direct Connect

A Terraform module to create Equinix Fabric layer 2 connection between:

* Fabric's port, or
* Network Edge virtual device

and Amazon Web Services using AWS Direct Connect hosted connection.

![Terraform status](https://github.com/equinix/terraform-equinix-fabric-aws/workflows/Terraform/badge.svg)
![License](https://img.shields.io/github/license/equinix/terraform-equinix-fabric-aws)

---

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| equinix | >= 1.0.0 |

## Providers

| Name | Version |
|---------|----------|
| equinix | >= 1.0.0 |

## Example usage

Check [examples](examples/) directory

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
|name|Name of the connection|`string`|`""`|yes|
|purchase_order_number|Purchase order number to link with connection on the invoice|`string`|`""`|no|
|notifications|List of email addresses that will receive notifications about connection|`list(string)`|n/a|yes|
|port_id|Equinix Fabric port identifier for the connection source (connection's a-side)|`string`|`""`|no|
|vlan_stag|Connection's vlan s-tag (outer tag)|`number`|`0`|no|
|vlan_ctag|Connection's vlan c-tag (inner tag)|`number`|`0`|no|
|device_id|Equinix Network Edge virtual device identifier for the connection source (connection's a-side)|`string`|`""`|no|
|device_interface_id|Equinix Network Edge virtual device interface identifier for the connection source (connection's a-side)|`string`|`""`|no|
|speed|Connection speed|`number`|`0`|yes|
|speed_unit|Connection speed unit|`string`|`""`|yes|
|aws_account_id|AWS account identifier|`string`|`""`|yes|
|aws_access_key|AWS access key|`string`|`""`|yes|
|aws_secret_key|AWS secret key|`string`|`""`|yes|
|aws_metro_code|Equinix metro code of AWS Direct Connect location|`string`|`""`|yes|
|aws_region|AWS Region associated with AWS Direct Connect location|`string`|`""`|yes|

### AWS Direct Connect metros and regions

Please check AWS Direct Connect Locations on official [AWS Direct COnnection Features
page](https://aws.amazon.com/directconnect/features) for details about possible
values of `aws_metro_code` and `aws_region` arguments.

## Outputs

| Name | Description |
|------|-------------|
|sp_name|Name of Equinix Fabric seller service profile used for a connection|
|id|Connection identifier|
|status|Connection provisioning status|
|provider_status|Connection provider status|
|zside_port_id|Equinix Fabric port identifier on the connection's remote side (z-side)|
|zside_vlan_stag|Vlan s-tag (outer tag) on the remote side (z-side) of the connection|
|zside_vlan_ctag|Vlan c-tag (inner tag) on the remote side (z-side) of the connection|
|aws_connection_id|The ID of the Direct Connect connection on AWS side|

# Digital Ocean Droplet Module

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | n/a |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_labels"></a> [labels](#module\_labels) | ../labels |  |

## Resources

| Name | Type |
|------|------|
| [digitalocean_droplet.main](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/droplet) | resource |
| [digitalocean_floating_ip.main](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/floating_ip) | resource |
| [digitalocean_floating_ip_assignment.main](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/floating_ip_assignment) | resource |
| [digitalocean_volume.main](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/volume) | resource |
| [digitalocean_volume_attachment.main](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/volume_attachment) | resource |
| [template_cloudinit_config.main](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/cloudinit_config) | data source |
| [template_file.main](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_vol_enabled"></a> [additional\_vol\_enabled](#input\_additional\_vol\_enabled) | Additional volume for droplet. | `bool` | `false` | no |
| <a name="input_additional_vol_name"></a> [additional\_vol\_name](#input\_additional\_vol\_name) | Name of additional volume. | `string` | `"data"` | no |
| <a name="input_additional_vol_size"></a> [additional\_vol\_size](#input\_additional\_vol\_size) | Size of additional volume. | `number` | `50` | no |
| <a name="input_application"></a> [application](#input\_application) | Application (e.g. `db` or `web`). | `string` | `""` | no |
| <a name="input_backups"></a> [backups](#input\_backups) | Boolean controlling if backups are made. Defaults to false. | `bool` | `false` | no |
| <a name="input_block_storage_filesystem_label"></a> [block\_storage\_filesystem\_label](#input\_block\_storage\_filesystem\_label) | Initial filesystem label for the block storage volume. | `string` | `"data"` | no |
| <a name="input_block_storage_filesystem_type"></a> [block\_storage\_filesystem\_type](#input\_block\_storage\_filesystem\_type) | Initial filesystem type (xfs or ext4) for the block storage volume. | `string` | `"xfs"` | no |
| <a name="input_cloud_init"></a> [cloud\_init](#input\_cloud\_init) | user data for droplet. | `string` | n/a | yes |
| <a name="input_createdby"></a> [createdby](#input\_createdby) | CreatedBy, eg 'terraform'. | `string` | `"terraform"` | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between `organization`, `environment`, `name` and `attributes`. | `string` | `"-"` | no |
| <a name="input_droplet_count"></a> [droplet\_count](#input\_droplet\_count) | The number of droplets / other resources to create | `number` | `1` | no |
| <a name="input_droplet_size"></a> [droplet\_size](#input\_droplet\_size) | the size slug of a droplet size | `string` | `"micro"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| <a name="input_floating_ip"></a> [floating\_ip](#input\_floating\_ip) | (Optional) Boolean to control whether floating IPs should be created. | `bool` | `false` | no |
| <a name="input_floating_ip_assign"></a> [floating\_ip\_assign](#input\_floating\_ip\_assign) | (Optional) Boolean controlling whether floatin IPs should be assigned to instances with Terraform. | `bool` | `true` | no |
| <a name="input_floating_ip_count"></a> [floating\_ip\_count](#input\_floating\_ip\_count) | Number of floating IPs to create. | `string` | `""` | no |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | The image name or slug to lookup. | `string` | `"ubuntu-18-04-x64"` | no |
| <a name="input_ipv6"></a> [ipv6](#input\_ipv6) | (Optional) Boolean controlling if IPv6 is enabled. Defaults to false. | `bool` | `false` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Label order, e.g. `name`,`application`. | `list(any)` | `[]` | no |
| <a name="input_monitoring"></a> [monitoring](#input\_monitoring) | (Optional) Boolean controlling whether monitoring agent is installed. Defaults to false. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| <a name="input_private_networking"></a> [private\_networking](#input\_private\_networking) | (Optional) Boolean controlling if private networks are enabled. Defaults to false. | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | The region to create VPC, like `london-1` , `bangalore-1` ,`newyork-3` `toronto-1`. | `string` | `"bangalore-1"` | no |
| <a name="input_resize_disk"></a> [resize\_disk](#input\_resize\_disk) | (Optional) Boolean controlling whether to increase the disk size when resizing a Droplet. It defaults to true. When set to false, only the Droplet's RAM and CPU will be resized. Increasing a Droplet's disk size is a permanent change. Increasing only RAM and CPU is reversible. | `bool` | `true` | no |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | (Optional) A list of SSH IDs or fingerprints to enable in the format [12345, 123456]. To retrieve this info, use a tool such as curl with the DigitalOcean API, to retrieve them. | `list(any)` | `[]` | no |
| <a name="input_vpc_uuid"></a> [vpc\_uuid](#input\_vpc\_uuid) | The ID of the VPC where the Droplet will be located. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Droplet. |
| <a name="output_ipv4_address"></a> [ipv4\_address](#output\_ipv4\_address) | Public Ipv4 address of the Droplet. |
| <a name="output_ipv4_address_private"></a> [ipv4\_address\_private](#output\_ipv4\_address\_private) | Pravite Ipv4 address of the Droplet. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Droplet. |
| <a name="output_urn"></a> [urn](#output\_urn) | The uniform resource name of the Droplet. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

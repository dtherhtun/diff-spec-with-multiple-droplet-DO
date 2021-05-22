# Digital Ocean Droplet VPC module

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_labels"></a> [labels](#module\_labels) | ../labels |  |

## Resources

| Name | Type |
|------|------|
| [digitalocean_vpc.default](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application"></a> [application](#input\_application) | Application (e.g. `cd` or `cloud`). | `string` | `""` | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between `organization`, `environment`, `name` and `attributes`. | `string` | `"-"` | no |
| <a name="input_description"></a> [description](#input\_description) | A free-form text field up to a limit of 255 characters to describe the VPC. | `string` | `"VPC"` | no |
| <a name="input_enable_vpc"></a> [enable\_vpc](#input\_enable\_vpc) | A boolean flag to enable/disable vpc. | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| <a name="input_ip_range"></a> [ip\_range](#input\_ip\_range) | The range of IP addresses for the VPC in CIDR notation. Network ranges cannot overlap with other networks in the same account and must be in range of private addresses as defined in RFC1918. It may not be larger than /16 or smaller than /24. | `string` | `"10.10.0.0/16"` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Label order, e.g. `name`,`application`. | `list(any)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | The region to create VPC, like `london-1` , `bangalore-1` ,`newyork-3` `toronto-1`. | `string` | `"bangalore-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_created_at"></a> [created\_at](#output\_created\_at) | The date and time of when the VPC was created. |
| <a name="output_default"></a> [default](#output\_default) | A boolean indicating whether or not the VPC is the default one for the region. |
| <a name="output_id"></a> [id](#output\_id) | The unique identifier for the VPC.. |
| <a name="output_urn"></a> [urn](#output\_urn) | The uniform resource name (URN) for the VPC. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

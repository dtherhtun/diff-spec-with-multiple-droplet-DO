# Digital Ocean Label Module

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

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_tag.application](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/tag) | resource |
| [digitalocean_tag.createdby](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/tag) | resource |
| [digitalocean_tag.environment](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/tag) | resource |
| [digitalocean_tag.id](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/tag) | resource |
| [digitalocean_tag.managedby](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/tag) | resource |
| [digitalocean_tag.name](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/tag) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application"></a> [application](#input\_application) | Application (e.g. `cd` or `cloud`). | `string` | `""` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | Additional attributes (e.g. `1`). | `list(any)` | `[]` | no |
| <a name="input_createdby"></a> [createdby](#input\_createdby) | CreatedBy, eg 'terraform'. | `string` | `"terraform"` | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between `organization`, `name`, `environment` and `attributes`. | `string` | `"-"` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Label order, e.g. `name`,`application`. | `list(any)` | `[]` | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | ManagedBy, eg 'AnmolNagpal'. | `string` | `"disaplayscience"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. map(`BusinessUnit`,`XYZ`). | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_application"></a> [application](#output\_application) | Normalized application. |
| <a name="output_createdby"></a> [createdby](#output\_createdby) | Normalized createdby. |
| <a name="output_environment"></a> [environment](#output\_environment) | Normalized environment. |
| <a name="output_id"></a> [id](#output\_id) | Disambiguated ID. |
| <a name="output_managedby"></a> [managedby](#output\_managedby) | Normalized managedby. |
| <a name="output_name"></a> [name](#output\_name) | Normalized name. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

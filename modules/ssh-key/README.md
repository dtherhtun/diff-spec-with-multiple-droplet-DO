# Digital Ocean Droplet SSH key module

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
| [digitalocean_ssh_key.default](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/ssh_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_ssh_key"></a> [enable\_ssh\_key](#input\_enable\_ssh\_key) | A boolean flag to enable/disable ssh key. | `bool` | `true` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Name  (e.g. `it-admin` or `devops`). | `string` | `""` | no |
| <a name="input_key_path"></a> [key\_path](#input\_key\_path) | Name  (e.g. `~/.ssh/id_rsa.pub` or `ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQ`). | `string` | `""` | no |
| <a name="input_ssh_key"></a> [ssh\_key](#input\_ssh\_key) | SSH key | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fingerprint"></a> [fingerprint](#output\_fingerprint) | The fingerprint of the SSH key. |
| <a name="output_id"></a> [id](#output\_id) | The unique ID of the key. |
| <a name="output_name"></a> [name](#output\_name) | The name of the SSH key. |
| <a name="output_public_key"></a> [public\_key](#output\_public\_key) | The text of the public key. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

# Digital Ocean Droplet

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | 2.8.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_droplet"></a> [droplet](#module\_droplet) | ./modules/droplet |  |
| <a name="module_ssh_key_tf_test"></a> [ssh\_key\_tf\_test](#module\_ssh\_key\_tf\_test) | ./modules/ssh-key |  |
| <a name="module_ssh_key_tony"></a> [ssh\_key\_tony](#module\_ssh\_key\_tony) | ./modules/ssh-key |  |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc |  |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_data"></a> [default\_data](#input\_default\_data) | (Optional) A string of the desired User Data for the Droplet. | `string` | `"default.sh"` | no |
| <a name="input_droplets"></a> [droplets](#input\_droplets) | Group variables of droplet Structure looks like this:<pre>droplets = {<br>  web = {<br>    image_name             = "ubuntu-18-04-x64"<br>    application            = "web"<br>    environment            = "test"<br>    label_order            = ["environment", "application", "name"]<br>    region                 = "singapore-1"<br>    droplet_size           = "nano"<br>    monitoring             = false<br>    private_networking     = true<br>    ipv6                   = false<br>    floating_ip            = true<br>    user_data              = "user-data.sh"<br>    additional_vol_enabled = false<br>    additional_vol_size    = 30<br>    additional_vol_name    = ""<br>  },<br>  db = {<br>    image_name             = "ubuntu-18-04-x64"<br>    application            = "web"<br>    environment            = "test"<br>    label_order            = ["environment", "application", "name"]<br>    region                 = "singapore-1"<br>    droplet_size           = "nano"<br>    monitoring             = false<br>    private_networking     = true<br>    ipv6                   = false<br>    floating_ip            = false<br>    user_data              = "user-data.sh"<br>    additional_vol_enabled = true<br>    additional_vol_size    = 30<br>    additional_vol_name    = "data-db"<br>  },<br>  sftp = {<br>    image_name             = "ubuntu-18-04-x64"<br>    application            = "web"<br>    environment            = "test"<br>    label_order            = ["environment", "application", "name"]<br>    region                 = "singapore-1"<br>    droplet_size           = "nano"<br>    monitoring             = false<br>    private_networking     = true<br>    ipv6                   = false<br>    floating_ip            = true<br>    user_data              = "user-data.sh"<br>    additional_vol_enabled = true<br>    additional_vol_size    = 30<br>    additional_vol_name    = "data-sftp"<br>  }<br>}</pre> | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The id of the Droplet |
| <a name="output_ipv4_address"></a> [ipv4\_address](#output\_ipv4\_address) | Public Ipv4 address of the Droplet. |
| <a name="output_ipv4_address_private"></a> [ipv4\_address\_private](#output\_ipv4\_address\_private) | Pravite Ipv4 address of the Droplet. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Droplet. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Usage

you can create multiple droplet by copying this module.

```
# In here, droplet is just module address. modules address can't be same. it need to be unique.
module "droplet" {
  # you don't need to touch this source
  source                 = "./modules/droplet"
  #name of your droplet.
  name                   = "droplet"
  # image of your droplet.
  image_name             = "ubuntu-18-04-x64"
  # this is used in namming and what propose for. good practice.
  application            = "web"
  # this also used in namming and which environment(dev,qa,production) for. good practice. 
  environment            = "test"
  # label of your droplet and used resources tags
  label_order            = ["environment", "application", "name"]
  # The region to create VPC, like london-1, bangalore-1, newyork-3, toronto-1. 
  region                 = "singapore-1"
  # (Optional) A list of SSH IDs or fingerprints to enable in the format [12345, 123456].
  ssh_keys               = [module.ssh_key.fingerprint]
  # The ID of the VPC where the Droplet will be located.
  vpc_uuid               = module.vpc.id
  # the size slug of a droplet size
  droplet_size           = "nano"
  # (Optional) Boolean controlling whether monitoring agent is installed. Defaults to false.
  monitoring             = false
  # (Optional) Boolean controlling if private networks are enabled. Defaults to false.
  private_networking     = true
  # (Optional) Boolean controlling if IPv6 is enabled. Defaults to false.
  ipv6                   = false
  # (Optional) Boolean to control whether floating IPs should be created.
  floating_ip            = true
  # (Optional) A string of the desired User Data for the Droplet.
  user_data              = file("user-data.sh")
  # (Optional) Additional volume for droplet.
  additional_vol_enabled = true
  # Require if additional_vol_enabled = true, depend on additional_vol_enabled variables.
  additional_vol_size    = 100
}
```

## For Droplet Size

```
    nano      = "s-1vcpu-1gb"
    micro     = "s-2vcpu-2gb"
    small     = "s-2vcpu-4gb"
    medium    = "s-4vcpu-8gb"
    large     = "s-6vcpu-16gb"
    x-large   = "s-8vcpu-32gb"
    xx-large  = "s-16vcpu-64gb"
    xxx-large = "s-24vcpu-128gb"
    maximum   = "s-32vcpu-192gb"
```

## For DO Region

```
    amsterdam-2 = "ams2"
    amsterdam-3 = "ams3"
    bangalore-1 = "blr1"
    frankfurt-1 = "fra1"
    london      = "lon-1"
    newyork-1   = "nyc1"
    newyork-2   = "nyc2"
    newyork-3   = "nyc3"
    francisco-1 = "sfo1"
    singapore-1 = "sgp1"
    toronto-1   = "tor1"
```


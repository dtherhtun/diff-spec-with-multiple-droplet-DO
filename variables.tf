variable "droplets" {
  type        = map(any)
  description = <<EOF
Group variables of droplet Structure looks like this:
```
droplets = {
  web = {
    image_name             = "ubuntu-18-04-x64"
    application            = "web"
    environment            = "test"
    label_order            = ["environment", "application", "name"]
    region                 = "singapore-1"
    droplet_size           = "nano"
    monitoring             = false
    private_networking     = true
    ipv6                   = false
    floating_ip            = true
    user_data              = "user-data.sh"
    additional_vol_enabled = false
    additional_vol_size    = 30
    additional_vol_name    = ""
  },
  db = {
    image_name             = "ubuntu-18-04-x64"
    application            = "web"
    environment            = "test"
    label_order            = ["environment", "application", "name"]
    region                 = "singapore-1"
    droplet_size           = "nano"
    monitoring             = false
    private_networking     = true
    ipv6                   = false
    floating_ip            = false
    user_data              = "user-data.sh"
    additional_vol_enabled = true
    additional_vol_size    = 30
    additional_vol_name    = "data-db"
  },
  sftp = {
    image_name             = "ubuntu-18-04-x64"
    application            = "web"
    environment            = "test"
    label_order            = ["environment", "application", "name"]
    region                 = "singapore-1"
    droplet_size           = "nano"
    monitoring             = false
    private_networking     = true
    ipv6                   = false
    floating_ip            = true
    user_data              = "user-data.sh"
    additional_vol_enabled = true
    additional_vol_size    = 30
    additional_vol_name    = "data-sftp"
  }
}
```
EOF
}

variable "default_data" {
  type        = string
  default     = "default.sh"
  description = "(Optional) A string of the desired User Data for the Droplet."
}
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
    floating_ip            = false
    cloud_init             = ""
    additional_vol_enabled = false
    additional_vol_size    = 30
    additional_vol_name    = ""
  },
  traefik = {
    image_name             = "centos-7-x64"
    application            = "traefik"
    environment            = "test"
    label_order            = ["environment", "application", "name"]
    region                 = "singapore-1"
    droplet_size           = "nano"
    monitoring             = false
    private_networking     = true
    ipv6                   = false
    floating_ip            = false
    cloud_init             = ""
    additional_vol_enabled = false
    additional_vol_size    = 30
    additional_vol_name    = ""
  }
}

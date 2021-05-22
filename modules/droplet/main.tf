locals {
  sizes = {
    nano      = "s-1vcpu-1gb"
    micro     = "s-2vcpu-2gb"
    small     = "s-2vcpu-4gb"
    medium    = "s-4vcpu-8gb"
    large     = "s-6vcpu-16gb"
    x-large   = "s-8vcpu-32gb"
    xx-large  = "s-16vcpu-64gb"
    xxx-large = "s-24vcpu-128gb"
    maximum   = "s-32vcpu-192gb"
  }
}

locals {
  region = {
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
  }
}

#Module      : Label
#Description : This terraform module is designed to generate consistent label names and
#              tags for resources. You can use terraform-labels to implement a strict
#              naming convention.
module "labels" {
  source      = "../labels"
  name        = var.name
  application = var.application
  environment = var.environment
  label_order = var.label_order
}

data "template_file" "main" {
  template = file(var.cloud_init)
}

data "template_cloudinit_config" "main" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    filename     = var.cloud_init
    content      = data.template_file.main.rendered
  }
}

#Module      : Droplet
#Description : Provides a DigitalOcean Droplet resource. This can be used to create, modify, and delete Droplets.
resource "digitalocean_droplet" "main" {
  count = var.droplet_count

  image              = var.image_name
  name               = format("%s%s%s", module.labels.id, var.delimiter, (count.index))
  region             = coalesce(local.region[var.region], var.region)
  size               = coalesce(local.sizes[var.droplet_size], var.droplet_size)
  backups            = var.backups
  monitoring         = var.monitoring
  ipv6               = var.ipv6
  private_networking = var.private_networking
  ssh_keys           = var.ssh_keys
  resize_disk        = var.resize_disk
  user_data          = data.template_cloudinit_config.main.rendered
  vpc_uuid           = var.vpc_uuid

  tags = [
    module.labels.name,
    module.labels.application,
    module.labels.environment,
    module.labels.createdby,
    module.labels.managedby
  ]
}

resource "digitalocean_volume" "main" {
  count                    = var.additional_vol_enabled == true ? var.droplet_count : 0
  region                   = coalesce(local.region[var.region], var.region)
  name                     = var.additional_vol_name
  size                     = var.additional_vol_size
  initial_filesystem_label = var.block_storage_filesystem_label
  initial_filesystem_type  = var.block_storage_filesystem_type
  tags = [
    format("%s%s%s%s%s", module.labels.id, var.delimiter, "volume", var.delimiter, (count.index)),
    module.labels.application,
    module.labels.environment,
    module.labels.createdby,
    module.labels.managedby
  ]
}

resource "digitalocean_volume_attachment" "main" {
  count      = var.additional_vol_enabled == true ? var.droplet_count : 0
  droplet_id = element(digitalocean_droplet.main.*.id, count.index)
  volume_id  = element(digitalocean_volume.main.*.id, count.index)
}

#Module      : Floating Ip
#Description : Provides a DigitalOcean Floating IP to represent a publicly-accessible static IP addresses that can be mapped to one of your Droplets.
resource "digitalocean_floating_ip" "main" {
  count  = var.floating_ip == true ? var.droplet_count : 0
  region = coalesce(local.region[var.region], var.region)
}

#Module      : Floating Ip Assignment
#Description : Provides a DigitalOcean Floating IP to represent a publicly-accessible static IP addresses that can be mapped to one of your Droplets.
resource "digitalocean_floating_ip_assignment" "main" {
  count = var.floating_ip == true ? var.droplet_count : 0

  ip_address = element(digitalocean_floating_ip.main.*.id, count.index)
  droplet_id = element(digitalocean_droplet.main.*.id, count.index)
  depends_on = [digitalocean_droplet.main]
}


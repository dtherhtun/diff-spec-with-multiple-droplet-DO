module "vpc" {
  source      = "./modules/vpc"
  name        = "vpc"
  application = "testing"
  environment = "test"
  label_order = ["environment", "application", "name"]
  enable_vpc  = true
  region      = "singapore-1"
}

#module "ssh_key" {
#  source         = "./modules/ssh-key"
#  key_path       = "~/.ssh/id_rsa.pub"
#  key_name       = "devops"
#  enable_ssh_key = true
#}

module "ssh_key_tony" {
  source         = "./modules/ssh-key"
  key_path       = "~/.ssh/id_rsa.pub"
  key_name       = "tony"
  enable_ssh_key = true
}

module "ssh_key_tf_test" {
  source         = "./modules/ssh-key"
  key_path       = "~/.ssh/id_tf_v1.pub"
  key_name       = "tf_test"
  enable_ssh_key = true
}

module "droplet" {
  source                 = "./modules/droplet"
  for_each               = var.droplets
  name                   = each.key
  image_name             = each.value.image_name
  application            = each.value.application
  environment            = each.value.environment
  label_order            = each.value.label_order
  region                 = each.value.region
  ssh_keys               = [module.ssh_key_tony.fingerprint, module.ssh_key_tf_test.fingerprint]
  vpc_uuid               = module.vpc.id
  droplet_size           = each.value.droplet_size
  monitoring             = each.value.monitoring
  private_networking     = each.value.private_networking
  ipv6                   = each.value.ipv6
  floating_ip            = each.value.floating_ip
  cloud_init             = each.value.cloud_init == "" ? var.default_data : each.value.cloud_init
  additional_vol_enabled = each.value.additional_vol_enabled
  additional_vol_size    = each.value.additional_vol_size
  additional_vol_name    = each.value.additional_vol_name
}

output "name" {
  value       = { for n in sort(keys(var.droplets)) : n => module.droplet[n].name }
  description = "The name of the Droplet."
}

output "id" {
  value       = { for n in sort(keys(var.droplets)) : n => module.droplet[n].id }
  description = "The id of the Droplet"
}

output "ipv4_address" {
  value       = { for n in sort(keys(var.droplets)) : n => module.droplet[n].ipv4_address }
  description = "Public Ipv4 address of the Droplet."
}

output "ipv4_address_private" {
  value       = { for n in sort(keys(var.droplets)) : n => module.droplet[n].ipv4_address_private }
  description = "Pravite Ipv4 address of the Droplet."
}


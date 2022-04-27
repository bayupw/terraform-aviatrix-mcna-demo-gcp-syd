output "lan_private_subnet" {
  description = "transit_vpc"
  value       = module.gcp_syd_transit03.transit_gateway.lan_private_subnet
}

output "ilb_vip_tcp" {
  description = "ilb_vip_tcp"
  value       = cidrhost(module.gcp_syd_transit03.transit_gateway.lan_private_subnet, 99)
}

output "ilb_vip_udp" {
  description = "ilb_vip_udp"
  value       = cidrhost(module.gcp_syd_transit03.transit_gateway.lan_private_subnet, 100)
}

# output "gcp_syd_prod03_vm" {
#   description = "GCP Sydney Prod03 VM"
#   value       = "${module.gcp_syd_prod03_vm.google_compute_instance.name}: ${module.gcp_syd_prod03_vm.google_compute_instance.network_interface[0].network_ip}"
# }

# output "gcp_syd_dev02_vm" {
#   description = "GCP Sydney Dev02 VM"
#   value       = "${module.gcp_syd_dev02_vm.google_compute_instance.name}: ${module.gcp_syd_dev02_vm.google_compute_instance.network_interface[0].network_ip}"
# }
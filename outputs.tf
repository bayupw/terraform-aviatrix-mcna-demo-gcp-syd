output "transit_vpc" {
  description = "transit_vpc"
  value       = module.gcp_syd_transit03.vpc
}

# output "transit_gateway" {
#   description = "transit_gateway"
#   value       = module.gcp_syd_transit03.transit_gateway
# }

# output "firenet" {
#   description = "aviatrix_firenet"
#   value       = module.gcp_syd_fortigate.aviatrix_firenet
# }

# output "firewall" {
#   description = "aviatrix_firenet"
#   value       = module.gcp_syd_fortigate.aviatrix_firewall_instance
# }

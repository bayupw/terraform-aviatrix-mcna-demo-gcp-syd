output "aviatrix_transit_gateway" {
  description = "aviatrix_transit_gateway"
  value       = module.gcp_syd_transit03.aviatrix_transit_gateway
}

output "gcp_syd_transit03_aviatrix_vpc" {
  description = "aviatrix_vpc"
  value       = module.gcp_syd_transit03.aviatrix_vpc
}

output "gcp_syd_fortigate_aviatrix_vpc" {
  description = "gcp_syd_fortigate"
  value       = module.gcp_syd_fortigate.aviatrix_vpc
  sensitive   = false
}
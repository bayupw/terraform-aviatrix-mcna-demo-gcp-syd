output "gcp_syd_transit03" {
  description = "gcp_syd_transit03"
  value       = module.gcp_syd_transit03
  sensitive   = false
}

output "gcp_syd_fortigate" {
  description = "gcp_syd_fortigate"
  value       = module.gcp_syd_fortigate
  sensitive   = false
}

output "zones" {
  description = "zones"
  value       = data.google_compute_zones.available
  sensitive   = false
}
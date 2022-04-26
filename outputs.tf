output "project" {
  description = "Project"
  value       = data.google_compute_zones.available.project
  sensitive   = false
}

output "region" {
  description = "Region"
  value       = data.google_compute_zones.available.region
  sensitive   = false
}
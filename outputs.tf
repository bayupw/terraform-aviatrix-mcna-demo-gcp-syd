output "project" {
  description = "Project"
  value       = data.google_compute_zones.available.project
  sensitive   = false
}

output "zones" {
  description = "zones"
  value       = data.google_compute_zones.available
  sensitive   = false
}
data "google_compute_zones" "available" {}

#######
# GCP #
#######

module "gcp_syd_transit03" {
  source  = "terraform-aviatrix-modules/mc-transit/aviatrix"
  version = "2.0.1"

  name                   = "gcp-syd-transit03"
  cloud                  = "gcp"
  region                 = "australia-southeast1"
  cidr                   = cidrsubnet(var.gcp_sgp_supernet, 7, 0)
  lan_cidr               = cidrsubnet(var.gcp_sgp_supernet, 7, 1)
  account                = var.gcp_account
  ha_gw                  = false
  single_az_ha           = false
  enable_segmentation    = true
  enable_transit_firenet = true

  local_as_number             = 65003
  learned_cidr_approval       = true
  learned_cidrs_approval_mode = "gateway"
}

# module "gcp_syd_fortigate" {
#   source  = "terraform-aviatrix-modules/mc-firenet/aviatrix"
#   version = "1.0.0"

#   custom_fw_names    = ["gcp-syd-fg"]
#   fw_amount          = 1
#   transit_module     = module.gcp_syd_transit03
#   firewall_image     = "Fortinet FortiGate Next-Generation Firewall"
#   instance_size      = "n1-highcpu-2"
#   egress_enabled     = false
#   inspection_enabled = false
#   password           = "Aviatrix123#"
#   egress_cidr        = cidrsubnet(var.gcp_sgp_supernet, 7, 2)

#   depends_on = [module.gcp_syd_transit03]
# }

module "gcp_syd_spoke_prod03" {
  source  = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  version = "1.1.2"

  name          = "gcp-syd-spoke-prod03"
  cloud         = "gcp"
  cidr          = cidrsubnet(var.gcp_sgp_supernet, 8, 11)
  region        = "australia-southeast1"
  account       = var.gcp_account
  instance_size = "n1-standard-1"
  single_az_ha  = false
  ha_gw         = false
  #attached      = false
  transit_gw = module.gcp_syd_transit03.transit_gateway.gw_name
}

module "gcp_syd_spoke_dev02" {
  source  = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  version = "1.1.2"

  name          = "gcp-syd-spoke-dev02"
  cloud         = "gcp"
  cidr          = cidrsubnet(var.gcp_sgp_supernet, 8, 12)
  region        = "australia-southeast1"
  account       = var.gcp_account
  instance_size = "n1-standard-1"
  single_az_ha  = false
  ha_gw         = false
  #attached      = false
  transit_gw = module.gcp_syd_transit03.transit_gateway.gw_name
}

module "gcp_syd_prod03_vm" {
  source  = "bayupw/ubuntu-vm/google"
  version = "1.0.0"

  vm_name      = "syd-prod03-vm"
  region       = "australia-southeast1"
  network_name = module.gcp_syd_spoke_prod03.vpc.id
  subnet_name  = module.gcp_syd_spoke_prod03.vpc.subnets[0].name

  depends_on = [module.gcp_syd_spoke_prod03]
}

module "gcp_syd_dev02_vm" {
  source  = "bayupw/ubuntu-vm/google"
  version = "1.0.0"

  vm_name      = "syd-dev02-vm"
  region       = "australia-southeast1"
  network_name = module.gcp_syd_spoke_dev02.vpc.id
  subnet_name  = module.gcp_syd_spoke_dev02.vpc.subnets[0].name

  depends_on = [module.gcp_syd_spoke_dev02]
}
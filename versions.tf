terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.19.0"
    }
    aviatrix = {
      source  = "aviatrixsystems/aviatrix"
      version = "~>2.21.2"
    }
  }
}
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.29" # Updated version potentially needed for AW/VPN features
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 5.10"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }
}
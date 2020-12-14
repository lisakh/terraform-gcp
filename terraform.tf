# Terraform backend configuration

terraform {

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.43"
    }
    rancher2 = {
      source  = "rancher/rancher2"
      version = "~> 1.10"
    }
  }
}


terraform {
  required_version = ">= 0.13"
  required_providers {
    equinix = {
      source  = "equinix/equinix"
      version = ">= 1.0"
    }
    aws = {
      source = "hashicorp/aws"
    }
  }
}

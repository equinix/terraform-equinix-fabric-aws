terraform {
  required_providers {
    equinix = {
      source  = "equinix/equinix"
      version = ">= 1.1"
    }
    aws = {
      source = "hashicorp/aws"
    }
  }
}

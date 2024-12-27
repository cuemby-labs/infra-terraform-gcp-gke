terraform {
  required_version = ">= 1.5.7"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.23.0"
    }
    google = {
      source = "hashicorp/google"
      version = "6.14.1"
    }
  }
}
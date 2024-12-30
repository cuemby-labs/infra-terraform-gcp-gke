terraform {
  required_version = ">= 1.5.7"

  required_providers {
    google = {
      source  = "opentofu/google"
      version = ">= 6.10.0"
    }
  }
}

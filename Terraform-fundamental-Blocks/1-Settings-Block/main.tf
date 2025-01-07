terraform {
  required_version = "~> 1.10.3"

  required_providers {
    #What provider i want to go with
    google = {
        version = "~> 6.15.0"
        source = "hashicorp/google"
    }
  }
}
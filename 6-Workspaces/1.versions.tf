terraform {
  required_version = "~>1.10.3"

  required_providers {
    google = {
      version = "~> 6.15.0"
      source  = "hashicorp/google"
    }
  }
}

provider "google" {
  credentials = "/home/tanmayeebasa28/keys.json"
  project     = "authentic-host-441701-i5"
}
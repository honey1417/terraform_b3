terraform {
  required_version = "~> 1.10.3"

  required_providers {
    google = {
      version = "~> 6.15.0"
      source  = "hashicorp/google"
    }
  }
}

provider "google" {
  credentials = "/home/tanmayeebasa28/1-Terraform-Fundamental-Blocks/keys.json"
  project     = "authentic-host-441701-i5"
  region      = "us-east1"
  zone        = "us-east1-b"
}

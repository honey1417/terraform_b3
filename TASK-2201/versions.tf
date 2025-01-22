terraform {
  required_version = "~>1.10.3"
}
terraform {
  required_providers {
    google = {
        version = "~>6.15.0"
        source = "hashicorp/google"
    }
  }
}

provider "google" {
  project = "authentic-host-441701-i5"
  region = var.region
  zone = var.zone
}
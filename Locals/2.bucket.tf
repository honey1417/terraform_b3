locals {
#complex expression used across multiple places
  bucket_name = "${var.app_name}-${var.env_name}-bucket"
  #boutique-dev-bucket
}



resource "google_storage_bucket" "local-bk" {
  name = local.bucket_name
  location = var.region
  labels = {
    name = local.bucket_name
    environment = var.env_name
  }
}
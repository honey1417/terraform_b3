#creating a bucket in gcp cloud 
resource "google_storage_bucket" "valid-bucket" {
  name = var.bucket_name
  location = "us-central1" 
}
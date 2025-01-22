#TO CREATE GCP BUCKET WITH FOR_EACH USING MAPS
resource "google_storage_bucket" "tf-buck-1" {
    for_each = {
    "dev" = "boutiq-micro-svcs"
    "qa" = "boutiq-micro-svcs-tst"
    "prod" = "boutiq-micro-svcs-prd"
  }
  name = "my-${each.key}-${each.value}"
  location = "us-central1"
  labels = {
    environment = each.key
  }
}  

terraform {
  required_version = "~>1.10.3"

  required_providers {
    google = {
      version = "~> 6.15.0"
      source  = "hashicorp/google"
    }
  }
  backend "gcs" {
  #the bucket should already be created
  bucket = "i27academy-bucket"
  prefix = "dev/terraform.tfstate" 
  #path to the state file in the bucket
  #by default gcp has locking mech. 
  #for AWS use dynamodb table and it should 
  #be created before mentioning here
  }
}

provider "google" {
  credentials = "/home/tanmayeebasa28/keys.json"
  project     = "authentic-host-441701-i5"
  region  = var.region
}
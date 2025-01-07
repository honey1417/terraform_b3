terraform {
    required_version = "~> 1.10.3"

    required_providers {
        google = {
            version = "~> 6.15.0"
            source = "hashicorp/google"
        }
    }
}

provider "google" {
  credentials = "path to svc account key"
  #static credentials
  #never mention credentials in ur source code
  #even if u use for testing, make sure u wont commit them in the scm
  project = "authentic-host-441701-i5"
  region = "us-central1"
  zone = "us-central1-a"
  
}
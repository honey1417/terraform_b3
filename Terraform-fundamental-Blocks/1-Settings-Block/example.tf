#SETTINGS BLOCK

terraform {
    #Required Terraform Version
    required_version = "~> 1.10.3"

    #Required Terraform Providers
    required_providers {
        aws = {
            version = "~> 5.82.0"
            source = "hashicorp/aws"
        }
        google = {
            version = "~> 6.15.0"
            source = "hashicorp/google"
        }
    }
#Remote backend solution to store terraform state information
#backend "s3"
#   bucket =
} 
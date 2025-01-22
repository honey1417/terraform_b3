variable "region" {
  description = "this is the region where the infra should be created"
  default = "us-central1"
  type = string
}

variable "machine_type" {
  description = "instance type used in infra"
  default = "e2-medium"
  type = string
}

variable "instance_count" {
  description = "how many instances r needed"
  default = 1
  type = number
}

variable "instance_name" {
  description = "this is instance name"
  default = "defaultname"
  type = string
}

variable "bucket_name" {
  description = "bucket name to start with gcp-"
  type = string
  default = "gcp-authentic-host-441701-i5" #u can call from terraform.tfvars as well
  validation {
    condition = length(var.bucket_name) > 4 && substr(var.bucket_name, 0, 4) == "gcp-"
    error_message = "bucket name should start with gcp-"
  }
}
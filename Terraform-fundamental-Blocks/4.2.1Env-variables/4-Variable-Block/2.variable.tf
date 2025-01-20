variable "region" {
  description = "this is the region where the infra should be created"
  default = "us-west1"
  type = string
}

variable "machine_type" {
  description = "instance type used in infra"
  default = "e2-medium"
  type = string
}

variable "instance_count" {
  description = "how man instances r needed"
  default = 2
  type = number
}
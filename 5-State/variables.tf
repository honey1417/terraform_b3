variable "region" {
  description = "this is the region where the infra should be created"
  default = "us-centra1"
  type = string
}

/*
variable "machine_type" {
  description = "instance type used in infra"
  #default = "e2-medium"
  #type = string
  type = list(string)
  default = [ "e2-small", "e2-medium", "e2-micro" ]

  #to refer them in the resource blocK
  #machine_type = var.machine_type[]
}*/

variable "instance_count" {
  description = "how many instances r needed"
  default = 1
  type = number
}

variable "instance_name" {
  description = "this is instance name"
  default = "state-vm"
  type = string
}

variable "machine_type" {
  description = "this is for map"
  type = map(string)
  default = {
    "dev" = "e2-small"
    "test" = "e2-micro"
    "prod" = "e2-medium"
  }
}
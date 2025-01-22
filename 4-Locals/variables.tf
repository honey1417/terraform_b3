variable "region" {
  default = "us-central1"
  description = "default region"
  type = string
}

variable "app_name" {
  default = "boutiq-eureka"
  type = string
}

variable "env_name" {
  default = "dev"
  type = string
}
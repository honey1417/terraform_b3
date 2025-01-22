variable "vpc-cidr-block" {}
#variable "instance_count" {}
variable "machine_type" {}
#create a vpc
resource "google_compute_network" "tf-vpc" {
  name = "i27-${terraform.workspace}-vpc"
  auto_create_subnetworks = false
}

#create subnet
resource "google_compute_subnetwork" "tf-sb" {
  name = "custom-sb"
  region = "us-central1"
  network = google_compute_network.tf-vpc.id
  ip_cidr_range = var.vpc-cidr-block
}

resource "google_compute_instance" "tf-vm" {
  
  count = terraform.workspace == "dev" ? 2 : 3
  #count = var.instance_count
  name = "webserver-${count.index}"
  zone = "us-central1-a"
  machine_type = var.machine_type
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
  network_interface {
    network = google_compute_network.tf-vpc.id
    subnetwork = google_compute_subnetwork.tf-sb.id
    access_config {}
   }

}
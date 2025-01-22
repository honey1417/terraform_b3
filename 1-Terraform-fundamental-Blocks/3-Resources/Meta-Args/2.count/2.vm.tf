resource "google_compute_instance" "tf-vm" {
  count = 3
  name = "count-vm-${count.index}" #count-vm-0,1,2 instances will create
  zone = "us-central1-c"
  machine_type = "e2-medium"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
  network_interface {
    network = "default" #Default network used for the instance
    access_config {} #This provides an external IP to the instance
   }
}
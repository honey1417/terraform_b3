resource "google_compute_instance" "tf-vm" {
  
  count = var.instance_count
  name = "${var.instance_name}-${count.index}"
  zone = "us-west1-c"
  machine_type = var.machine_type["dev"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
  network_interface {
    network = "default"
    access_config {}
   }
   
} 
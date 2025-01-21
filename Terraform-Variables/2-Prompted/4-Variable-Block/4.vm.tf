resource "google_compute_instance" "tf-vm" {
  
  count = var.instance_count
  name = "variable-vm-${count.index}"
  zone = "us-west1-c"
  machine_type = var.machine_type
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

#use terraform plan -var="key=value" cmnd
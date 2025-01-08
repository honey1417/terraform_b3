#to create a vm

#depends on ***static ip, vpc, subnet***

#name, machinetype, bootdisk, zone, n/w (mandatory)

resource "google_compute_instance" "tf-vm" {
  name = "tf-vm-1"
  zone = "us-east1-b"
  machine_type = "e2-medium"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
  #N/w Interface Configuration
  network_interface {
    network = google_compute_network.tf-vpc.id
    subnetwork = google_compute_subnetwork.tf-subnet.id
    access_config {
      nat_ip = google_compute_address.tf-ip.address
    }
  }
  #add the startup script
  metadata_startup_script = file("script.sh")
  
  #Explicit dependencies
  depends_on = [ 
  google_compute_network.tf-vpc,
  google_compute_subnetwork.tf-subnet,
  google_compute_address.tf-ip,
  ]

}
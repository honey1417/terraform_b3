#create vpc
resource "google_compute_network" "task-vpc" {
  name = var.vpc-name
  auto_create_subnetworks = false
}

#create subnet
resource "google_compute_subnetwork" "task-sb" {
  name = var.sb-name
  region = var.region
  network = google_compute_network.task-vpc.id
  ip_cidr_range = var.ip_cidr_range

}

#create route to internet
#destn_range,name,n/w (mandatory)
resource "google_compute_route" "task-rt" {
  name = "task-route"
  network = google_compute_network.task-vpc.id
  #all external ip's(internet)
  dest_range = "0.0.0.0/0"
  #using default gateway
  next_hop_gateway = "default-internet-gateway"
}

#create firewalls for 80,22,8080
resource "google_compute_firewall" "task-fw" {
  name = "task-fw-allow-ssh-http"
  network = google_compute_network.task-vpc.id
  source_ranges = ["0.0.0.0/0"]
  allow {
    ports = ["22", "80", "8080" ]
    protocol = "tcp"
  }
}
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}
resource "local_file" "private_key" {
  content  = tls_private_key.ssh_key.private_key_pem
  filename =  "~/.ssh/my-gcp-key.pem" # Save to your local system
}

resource "local_file" "public_key" {
  content  = tls_private_key.ssh_key.public_key_openssh
  filename = "~/.ssh/my-gcp-key.pub"
}



#create vm with above subnet,keypair,firewalls
#make sure that this vm is having docker installed
#when vm created, there should be container running
#inside vm
#we should be able to access the container from 
#vm public ip

resource "google_compute_instance" "task-vm" {
  name = "task-vm"
  zone = var.zone
  machine_type = var.machine_type
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
  network_interface {
    network = google_compute_network.task-vpc.id
    subnetwork = google_compute_subnetwork.task-sb.id
    access_config {}
  }
  metadata_startup_script = <<EOT
#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y docker.io
docker run -d -p 80:80 --name docker-cont nginx
EOT
  labels = {
    cont = "docker"
  }

  depends_on = [ google_compute_network.task-vpc, 
  google_compute_subnetwork.task-sb,
  google_compute_firewall.task-fw]
  
}

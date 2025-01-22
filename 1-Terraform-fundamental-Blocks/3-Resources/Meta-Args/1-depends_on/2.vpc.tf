#create a vpc 
#create a subnet
#use a default internet gateway
#create a route table 
#create a explicit route to internet from the RT created previously
#create a firewall for port 22,80,8080



##create a custom vpc
#vpc global resource
resource "google_compute_network" "tf-vpc" {
  name = "terraform-vpc"
  auto_create_subnetworks = false
}

#create a custom subnet 
#regional resource 
#name,region,n/w,cidr range (mandatory)
resource "google_compute_subnetwork" "tf-subnet" {
  name = "tf-sb-a"
  region = "us-east1"
  network = google_compute_network.tf-vpc.id
  ip_cidr_range = "10.1.1.0/24"
}

#create a route
#destn_range,name,n/w (mandatory)
resource "google_compute_route" "tf-rt" {
  name = "tf-route"
  network = google_compute_network.tf-vpc.id
  dest_range = "0.0.0.0/0"  # All external IPs (internet)
  next_hop_gateway = "default-internet-gateway" # Use default internet gateway
}

#create firewall for port 22,80,8080
resource "google_compute_firewall" "tf-fw" {
  name = "tf-allow-ssh-http"
  network = google_compute_network.tf-vpc.id
  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports = ["22", "80", "8080"]
  }

}

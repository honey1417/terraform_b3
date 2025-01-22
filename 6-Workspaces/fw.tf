#create firewall for port 22,80,8080
resource "google_compute_firewall" "tf-fw-ssh" {
  name = "tf-fw-ssh-${terraform.workspace}"
  network = google_compute_network.tf-vpc.id
  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  allow {
    protocol = "tcp"
    ports = ["22"]
  }

}

resource "google_compute_firewall" "tf-fw-http-https" {
  name = "tf-fw-http-https-${terraform.workspace}"
  network = google_compute_network.tf-vpc.id
  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  allow {
    protocol = "tcp"
    ports = [ "80", "443","8080"]
  }
}
#create firewall for port 22,80,443
resource "google_compute_firewall" "tf-fw-ssh" {
  name = "tf-allow-ssh"
  network = "default"
  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  allow {
    protocol = "tcp"
    ports = ["22"]
  }

}

resource "google_compute_firewall" "tf-fw-http-https" {
  name = "tf-allow-http-https"
  network = "default"
  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  allow {
    protocol = "tcp"
    ports = [ "80", "443","8080"]
  }
}
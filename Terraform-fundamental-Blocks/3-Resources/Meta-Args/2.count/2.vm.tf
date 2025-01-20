resource "google_compute_instance" "tf-cvm1" {
    count = 3
    name = "count-vm"
    zone = "us-central1-c"
    machine_type = "e2-medium"
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-12"
        }
    }
}
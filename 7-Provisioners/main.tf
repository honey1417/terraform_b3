provider "google" {
  credentials = "/home/tanmayeebasa28/keys.json"
  project = "authentic-host-441701-i5"
  region = "us-central1"
}

resource "google_compute_instance" "prov-vm" {
  name = "provisioner-vm"
  zone = "us-central1-a"
  machine_type = "e2-small"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
  network_interface {
    network = "default"
    access_config {}
  }
  metadata = {
    ssh-keys = "tanmayeebasa28:${file("/home/tanmayeebasa28/.ssh/id_rsa.pub")}"
  }
  connection {
    type = "ssh"
    user = "tanmayeebasa28"
    private_key = file("/home/tanmayeebasa28/.ssh/id_rsa")
    host = self.network_interface[0].access_config[0].nat_ip
  }
#File Provisioner: copies localfile/dir to resource created
provisioner "file" {
  source = "local-file.txt"
  destination = "/tmp/remote-file.txt"
}
#local-exec: executes cmnd locally
# Local-Exec: Executes command locally
  provisioner "local-exec" {
    command = "echo 'VM IP Address: ${self.network_interface[0].access_config[0].nat_ip}' >> outputs.txt"
  }

provisioner "remote-exec" {
  inline = [ "sudo apt-get update -y",
    "sudo apt-get install -y apache2",
    "echo '<h1> Welcome to Terraform Provisioning</h1>' | sudo tee /var/www/html/index.html",
   ]
}
}
output "vm-nat_ip" {
  value = google_compute_instance.prov-vm.network_interface[0].access_config[0].nat_ip
}


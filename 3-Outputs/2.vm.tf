resource "google_compute_instance" "tf-vm" {
  
  count = var.instance_count
  name = "${var.instance_name}-${count.index}"
  zone = "us-west1-c"
  machine_type = var.machine_type["test"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
  network_interface {
    network = "default"
    access_config {}
   }
  metadata_startup_script = <<EOT
 #!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2

# Create the webpage with a welcome message
echo "<h1> welcome to depends_on session</h1>" | sudo tee /var/www/html/index.html

# Ensure the file has correct ownership and permissions so Apache can serve it
sudo chown www-data:www-data /var/www/html/index.html
sudo chmod 644 /var/www/html/index.html

# Restart Apache to ensure it serves the updated content
sudo systemctl restart apache2

# Confirm the content of the file
echo "Content of /var/www/html/index.html:"
cat /var/www/html/index.html
EOT
} 
#used to configure the output value

#resource_name.local_name.attribute

output "firewalls" {
  description = "provides list of firewalls"
  value = [ google_compute_firewall.tf-fw-http-https.name,
  google_compute_firewall.tf-fw-ssh.name
  ]
}

output "public-ip-op" {
  description = "provides public ip"
  value = google_compute_instance.tf-vm[0].network_interface[0].access_config[0].nat_ip
}


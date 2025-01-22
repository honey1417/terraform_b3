output "vm-fw" {
  description = "list firewall name"
  value = google_compute_firewall.task-fw.name
}

output "vm-public-ip" {
  description = "provides public-ip"
  value = google_compute_instance.task-vm.network_interface[0].access_config[0].nat_ip
}

output "cidr-range" {
  value = var.ip_cidr_range
}
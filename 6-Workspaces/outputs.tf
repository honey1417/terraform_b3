output "current_workspace" {
  value = terraform.workspace
}

output "public-ip-op" {
  value = google_compute_instance.tf-vm[*].network_interface[*].access_config[*].nat_ip
}

#terraform workspace show 
#terraform workspace select workspace
#terraform workspace new <workspace-name>
#terraform workspace delete <workspace-name>
#terraform workspace list
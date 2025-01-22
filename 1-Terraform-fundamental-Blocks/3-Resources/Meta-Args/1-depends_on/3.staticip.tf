#create a Static IP
#*******depends on VPC****
resource "google_compute_address" "tf-ip" {
  name = "tf-static-ip"
  region = "us-east1"
  #IMPLEMENTING META-ARGS
  #this static should be created only after VPC
  #its recommended to not use multiple depends_on
  depends_on = [ google_compute_network.tf-vpc ]
}
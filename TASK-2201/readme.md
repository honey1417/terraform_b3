```
Create a VPC
Create a Subnet
Create a new route table and add default internet gateway association to it
Create a Security Group for 80, 22, 8080
Create a key pair locally (In your local machine)
Create a VM machine with the above created Subnets, keypair, FW's
Make sure that this VM is having 'docker' installed on it
When the VM machine is created, there should be a 'container' running inside the VM
We should be able to access the container form the VM ip address
Use Variables, output block for input and output variables
```


# Generate SSH Key Pair (Locally)
```
add this in resource block of vm
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key" {
  content  = tls_private_key.ssh_key.private_key_pem
  filename = "~/.ssh/my-gcp-key.pem"  # Save to your local system
}

resource "local_file" "public_key" {
  content  = tls_private_key.ssh_key.public_key_openssh
  filename = "~/.ssh/my-gcp-key.pub"
}
```

### ERRORS
```docker ps -a
permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/containers/json?all=1": dial unix /var/run/docker.sock: connect: permission denied

 1.The error occurs because the current user does not have permission to access Docker's socket (/var/run/docker.sock).
 2.By adding the user to the docker group, it will grant the necessary permissions to interact with the Docker daemon.
```
### solution
```bash 
1.Check Docker Group: groups $USER
2.Add User to Docker Group: sudo usermod -aG docker $USER
3.Refresh Group Membership: newgrp docker
4.Verify Access: docker ps -a

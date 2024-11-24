# EC2 Instance for FRONTEND

resource "aws_instance" "frontend_server" {
  ami           = "ami-0866a3c8686eaeeba" 
  instance_type = "t2.micro"

  security_groups = [aws_security_group.frontend_server.name]

  key_name = "vockey"

  tags = {
    Name = "Frontend server"
  }
}

resource "terraform_data" "ssh_connection_frontend" {
  provisioner "remote-exec" {
    inline = [
      "echo \"$HOSTNAME connected...\"",
    ]
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(pathexpand("~/.ssh/labsuser.pem"))
    host        = aws_instance.frontend_server.public_ip
  }
}
# EC2 Instance for BACKEND

resource "aws_instance" "backend_server" {
  ami           = "ami-0866a3c8686eaeeba" # Ubuntu 24.04 LTS us-west-1
  instance_type = "t2.micro"

  security_groups = [aws_security_group.backend_server.name]

  key_name = "vockey"

  tags = {
    Name = "Backend Server"
  }
}



# Temporary connections, to check if the machine is available
resource "terraform_data" "ssh_connection_backend" {
  provisioner "remote-exec" {
    inline = [
      "echo \"$HOSTNAME connected...\"",
    ]
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(pathexpand("~/.ssh/labsuser.pem"))
    host        = aws_instance.backend_server.public_ip
  }
}
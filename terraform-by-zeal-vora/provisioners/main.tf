provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "website" {
  ami           = "ami-062df10d14676e201"
  instance_type = "t2.micro"
  key_name = "terraform-key"

  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("./terraform-key.pem")
    host = self.public_ip

  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get install apache2 -y",
      "sudo systemctl start apache2 ",
      "systemctl enable apache2"
    ]
  }
}
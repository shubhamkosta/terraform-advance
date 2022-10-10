provider "aws" {
  
}
 
resource "aws_instance" "ubuntu-server" {
  ami = lookup(var.ami, var.region)
  instance_type = "t2.micro"
}
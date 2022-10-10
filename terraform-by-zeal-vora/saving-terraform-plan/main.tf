provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "ec2-user" {
  ami = "how are you bro ???"
  instance_type = "t2.micro"
}
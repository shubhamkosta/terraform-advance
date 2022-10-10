provider "aws" {
#   region = "ap-south-1"
  region = "us-east-1"
}
data "aws_ami" "myami" {
  most_recent = true

  owners = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "datasource" {
  ami = "${data.aws_ami.myami.id}"
  instance_type = "t2.micro"
}
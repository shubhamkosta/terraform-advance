provider "aws" {
  
}

resource "aws_instance" "virtual-machine" {
  ami = "ami-062df10d14676e201"
  instance_type = "t2.micro"
  count = 5
  tags = {
    "name" = "${var.myec2-name[count.index]}"
  }
}
provider "aws" {
  region = "ap-south-1"
}

variable "sg-ports" {
  type = list(number)
  description = "Define ingress ports in sg using dynamic blocks"
  default = [ 22,80,443,8080,3389 ]
}
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  dynamic "ingress" {
    for_each = var.sg-ports
    content {
    description      = "TLS from VPC"
    from_port        = ingress.value
    to_port          = ingress.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

    }
  }
  tags = {
    Name = "allow_tls"
  }
}
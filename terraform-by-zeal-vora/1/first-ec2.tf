provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "webserver1" {
  ami = "ami-062df10d14676e201"
  instance_type = "t2.micro"
  # security_groups = "${aws_security_group.allow_tls.id}"
  tags = {
    "name" = "web1"
  }
}

resource "aws_s3_bucket" "mys3bucket" {
  bucket = "tiger-shhubam-kacchu-sourabh-maa-papa"
}

# resource "aws_eip" "lb" {
#   instance = aws_instance.webserver1.id
#   vpc      = true
# }

# resource "aws_eip_association" "eip_assoc" {
#   instance_id   = "${aws_instance.webserver1.id}"
#   allocation_id = "${aws_eip.lb.id}"
# }

# resource "aws_vpc" "main" {

# }


resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  # vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["${var.ip_address}"]
  }
  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["${var.ip_address}"]
  }
  ingress {
    description      = "TLS from VPC"
    from_port        = 53
    to_port          = 53
    protocol         = "tcp"
    cidr_blocks      = ["${var.ip_address}"]
  }
}
output "InstanceId" {
  value = "${aws_instance.webserver1.id}"
}

output "mybucketdnsname" {
  value = aws_s3_bucket.mys3bucket.bucket_domain_name
}
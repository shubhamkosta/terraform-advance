# provider "aws" {
#   region = "us-east-1"
# }

# resource "aws_instance" "webserver2" {
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = "t2.micro"

#   tags = {
#     Name = "web2"
#   }
# }
provider "aws" {
  region = "ap-south-1"
}

locals {
  comman-tags = {
    owner = "shubham"
    service = "devops-team"
  }
}
resource "aws_instance" "dev" {
  ami = "ami-062df10d14676e201"
  instance_type = "t2.micro"
  tags = local.comman-tags
  # count = var.istest==true? 1:0
}
resource "aws_instance" "prod" {
  ami = "ami-062df10d14676e201"
  instance_type = "t2.medium"
  tags = local.comman-tags
  # count = var.istest==false? 1:0
}
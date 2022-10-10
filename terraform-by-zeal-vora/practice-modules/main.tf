# provider "aws" {
#   region = "ap-south-1"
# }

provider "aws" {
  region = "ap-south-1"
}

module "first-module" {
  source = "./projects/ec2"
}
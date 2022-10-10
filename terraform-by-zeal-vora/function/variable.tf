variable "ami" {
  type = map
  default = {
    "ap-south-1" = "ami-062df10d14676e201"
    "us-east-1" = "ami-026b57f3c383c2eec"
    "ap-northeast-1" = "ami-03f4fa076d2981b45"
  }
}
locals {
  timeanddate = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}
variable "region" {
  default = "ap-south-1"
}
output "current-time-and-date" {
  value = "${local.timeanddate}"
}
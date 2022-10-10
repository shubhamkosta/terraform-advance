provider "aws" {
  region = "ap-south-1"
}

resource "aws_iam_user" "iam" {
  for_each = toset(["user-0", "user-1", "user-2", "user-3"])
  name = each.key
}
provider "aws" {
  region = "ap-south-1"
}

resource "aws_iam_user" "list" {
  name = "iamuser.${count.index}"
  count = 3
  path = "/system/"
}

output "arns" {
  value = aws_iam_user.list[*].arn
}

output "name" {
  value = aws_iam_user.list[*].name
}

output "iam-all-details" {
  value = zipmap(aws_iam_user.list[*].name,aws_iam_user.list[*].arn)
}
provider "aws" {
  region = "ap-south-1"  
}

module "iam_user" {
  source = "../"

  name        = "iam-user"
  application = "aashish"
  environment = "test"
  label_order = ["environment", "name", "application"]

  enabled        = true
  policy_enabled = true
  policy         = data.aws_iam_policy_document.default.json
}

data "aws_iam_policy_document" "default" {
  statement {
    actions = [
      "ec2:Describe*"
    ]
    effect    = "Allow"
    resources = ["*"]
  }
}
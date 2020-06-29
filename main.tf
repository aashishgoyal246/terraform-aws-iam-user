#Module      : LABELS
#Description : This terraform module is designed to generate consistent label names and tags
#              for resources. You can use terraform-labels to implement a strict naming
#              convention.
module "labels" {
  source = "git::https://github.com/aashishgoyal246/terraform-labels.git?ref=tags/0.12.0"

  name        = var.name
  application = var.application
  environment = var.environment
  enabled     = var.enabled
  label_order = var.label_order
  tags        = var.tags
}

# Module      : IAM User
# Description : Terraform module to create IAM User resource on AWS.
resource "aws_iam_user" "default" {
  count                = var.enabled ? 1 : 0
  name                 = module.labels.id
  force_destroy        = var.force_destroy
  path                 = var.path
  permissions_boundary = var.permissions_boundary
  tags                 = module.labels.tags
}

resource "aws_iam_access_key" "default" {
  count   = var.enabled ? 1 : 0
  user    = join("", aws_iam_user.default.*.name)
  pgp_key = var.pgp_key
  status  = var.status
}

resource "aws_iam_user_policy" "default" {
  count  = var.enabled && var.policy_enabled && var.policy_arn == "" ? 1 : 0
  name   = format("%s-policy", module.labels.id)
  user   = join("", aws_iam_user.default.*.name)
  policy = var.policy
}

resource "aws_iam_user_policy_attachment" "default" {
  count      = var.enabled && var.policy_enabled && var.policy_arn != "" ? 1 : 0
  user       = join("", aws_iam_user.default.*.name)
  policy_arn = var.policy_arn
}
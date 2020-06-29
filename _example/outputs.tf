# Module      : IAM Role
# Description : Terraform module to create Iam Role resource on AWS.
output "arn" {
  value       = module.iam_user.*.arn
  description = "The ARN assigned by AWS for this user."
}

output "unique_id" {
  value       = module.iam_user.*.unique_id
  description = "The unique ID assigned by AWS for this user."
}

output "key_id" {
  value       = module.iam_user.*.key_id
  description = "The ARN assigned by AWS for this user."
}

output "secret" {
  value       = module.iam_user.*.secret
  description = "The ARN assigned by AWS for this user."
}

output "tags" {
  value       = module.iam_user.tags
  description = "A mapping of tags to assign to the resource."
}
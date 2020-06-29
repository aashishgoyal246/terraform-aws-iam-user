#Module      : LABELS
#Description : Terraform label module variables.
variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "application" {
  type        = string
  default     = ""
  description = "Application (e.g. `cd` or `clouddrove`)."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "enabled" {
  type        = bool
  default     = false
  description = "Flag to control the vpc creation."
}

variable "label_order" {
  type        = list
  default     = []
  description = "Label order, e.g. `name`,`application`."
}

variable "tags" {
  type        = map
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)."
}

# Module      : IAM User
# Description : Terraform IAM User module variables.
variable "force_destroy" {
  type        = bool
  default     = false
  description = "When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed."
}

variable "path" {
  type        = string
  default     = "/"
  description = "The path to the role."
}

variable "permissions_boundary" {
  type        = string
  default     = ""
  description = "The ARN of the policy that is used to set the permissions boundary for the role."
}

variable "pgp_key" {
  type        = string
  default     = ""
  description = "Either a base-64 encoded PGP public key, or a keybase username in the form keybase:some_person_that_exists."
}

variable "status" {
  type        = string
  default     = "Active"
  description = "The access key status to apply. Defaults to Active. Valid values are Active and Inactive."
}

variable "policy" {
  type        = any
  default     = null
  description = "The policy document."
}

variable "policy_enabled" {
  type        = bool
  default     = false
  description = "Whether to Attach Iam policy with user."
}

variable "policy_arn" {
  type        = string
  default     = ""
  description = "The ARN of the policy you want to apply."
}
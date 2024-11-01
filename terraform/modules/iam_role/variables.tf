variable "region" {
  description = "Name of the AWS region (i.e: us-east-1)"
}

variable "role_name" {
  description = "IAM Role name"
}

variable "policy_arns" {
  type        = list(string)
  description = "List of policy ARNs"
}

variable "create_instance_profile" {
  type        = bool
  description = "Whether to create instance profile or not"
}

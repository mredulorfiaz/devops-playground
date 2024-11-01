variable "region" {
  description = "Name of the AWS region (i.e: us-east-1)"
}

variable "name" {
  description = "Name of the EKS cluster"
}

variable "cluster_version" {
  description = "EKS cluster's kubernetes version"
}

variable "vpc_name" {
  description = "Name of VPC where the cluster will be created"
}

variable "subnet_name" {
  description = "Name of the subnets to be attached with the EKS cluster (i.e: *ci-cd-private*)"
}

variable "instance_type" {
  description = "Instance type of the self-managed EKS cluster"
}

variable "min_size" {
  description = "Minimum number of nodes in self-managed node groups of EKS cluster"
}

variable "max_size" {
  description = "Maximum number of nodes in self-managed node groups of EKS cluster"
}

variable "desired_size" {
  description = "Desired number of nodes in self-managed node groups of EKS cluster"
}

variable "public_access" {
  description = "Controls API server public access"
}

variable "aws_auth_users" {
  description = "AWS auth users list to allow access"
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))
}

variable "aws_auth_roles" {
  description = "AWS auth roles list to allow access"
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))
}

variable "aws_auth_accounts" {
  description = "AWS auth accounts to allow access"
  type        = list(string)
}

variable "tags" {
  description = "Tags to be attached with the EKS cluster"
}


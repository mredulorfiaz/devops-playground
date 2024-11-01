variable "region" {
  description = "Name of the AWS region (i.e: us-east-1)"
}

variable "instance_name" {
  description = "Name of the EC2 Instance"
}

variable "iam_instance_profile" {
  description = "Name of the instance profile to be attached with the EC2 instance"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
}

variable "machine_type" {
  description = "Machine type for the EC2 instance"
  type        = string
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
}


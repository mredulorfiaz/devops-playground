variable "region" {
  description = "Name of the AWS region (i.e: us-east-1)"
}

variable "name" {
  description = "Name of the VPC"
}

variable "vpc_cidr" {
  description = "VPC CIDR range"
}

variable "tags" {
  description = "Tag to be used for VPC"
}

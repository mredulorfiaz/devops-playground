variable "name" {
  description = "Configure a name for fck-nat"
  default     = "fck-nat"
  type        = string
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
}

data "aws_subnets" "subnets" {
  filter {
    name   = "tag:Name"
    values = [var.subnet_name]
  }
}

data "aws_vpcs" "vpc" {
  tags = {
    Name = var.vpc_name
  }
}

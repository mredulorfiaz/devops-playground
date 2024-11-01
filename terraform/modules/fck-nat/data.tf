data "aws_vpc" "vpc" {
  tags = {
    Name = var.vpc_name
  }
}

data "aws_subnets" "subnets" {
  filter {
    name   = "tag:Name"
    values = ["*${var.vpc_name}-internal*"]
  }
}

data "aws_route_tables" "rts" {
  vpc_id = local.vpc_id

  filter {
    name   = "tag:Name"
    values = ["*${var.vpc_name}-internal*"]
  }
}

locals {
  azs = slice(data.aws_availability_zones.available.names, 0, 3)
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.13.0"

  name = var.name
  cidr = var.vpc_cidr

  azs                = local.azs
  private_subnets    = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k)]
  public_subnets     = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k + 4)]
  enable_nat_gateway = false
  single_nat_gateway = true
  create_igw         = true

  private_subnet_suffix = "internal"
  public_subnet_suffix  = "external"

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }

  tags = var.tags
}

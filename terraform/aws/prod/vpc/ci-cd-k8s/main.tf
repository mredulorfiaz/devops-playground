module "vpc" {
  source   = "../../../../modules/vpc"
  name     = local.name
  region   = local.region
  vpc_cidr = local.vpc_cidr
  tags     = local.tags
}

module "fck_nat" {
  count      = local.create_fck_nat ? 1 : 0
  source     = "../../../../modules/fck-nat"
  vpc_name   = local.name
  depends_on = [module.vpc]
}

module "instance_profile" {
  source                  = "../../../../modules/iam_role"
  create_instance_profile = true
  role_name               = local.iam_role_name
  region                  = local.region
  policy_arns             = local.policy_arns
}

module "ec2" {
  source               = "../../../../modules/ec2"
  instance_name        = local.instance_name
  vpc_name             = local.vpc_name
  machine_type         = local.machine_type
  subnet_name          = local.subnet_name
  instance_type        = local.instance_type
  region               = local.region
  iam_instance_profile = local.iam_instance_profile
}

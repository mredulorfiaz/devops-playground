module "eks" {
  source            = "../../../../modules/eks"
  region            = local.region
  vpc_name          = local.vpc_name
  subnet_name       = local.subnet_name
  name              = local.name
  cluster_version   = local.cluster_version
  instance_type     = local.instance_type
  min_size          = local.min_size
  max_size          = local.max_size
  desired_size      = local.desired_size
  public_access     = local.public_access
  aws_auth_users    = local.aws_auth_users
  aws_auth_roles    = local.aws_auth_roles
  aws_auth_accounts = []
  tags              = {}
}

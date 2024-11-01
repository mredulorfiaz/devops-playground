module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = var.name
  cluster_version = var.cluster_version

  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }

  vpc_id     = data.aws_vpcs.vpc.ids[0]
  subnet_ids = data.aws_subnets.subnets.ids

  self_managed_node_groups = {
    primary-worker-group = {
      ami_type      = "AL2_x86_64"
      instance_type = var.instance_type

      min_size     = var.min_size
      max_size     = var.max_size
      desired_size = var.desired_size
    }
  }

  cluster_endpoint_public_access = var.public_access
  create_aws_auth_configmap      = true
  manage_aws_auth_configmap      = true
  aws_auth_users                 = var.aws_auth_users
  aws_auth_roles                 = var.aws_auth_roles

  tags = var.tags
}

module "eks_auth" {
  source  = "terraform-aws-modules/eks/aws//modules/aws-auth"
  version = "~> 20.0"

  manage_aws_auth_configmap = true

  aws_auth_roles = var.aws_auth_roles

  aws_auth_users = var.aws_auth_users

  aws_auth_accounts = var.aws_auth_accounts
}

module "addons" {
  source                        = "../kubernetes-addons"
  region                        = var.region
  name                          = var.name
  deploy_alb_ingress_controller = true
  deploy_kubernetes_dashboard   = true
}

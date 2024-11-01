locals {
  region          = "ap-south-1"
  name            = "ci-cd-k8s"
  cluster_version = "1.31"
  vpc_name        = ""
  instance_type   = "m6i.large"
  min_size        = 1
  max_size        = 1
  desired_size    = 1
  public_access   = true
  subnet_name     = "*ci-cd-k8s-private*"
  aws_auth_users = [
    {
      userarn  = "arn:aws:iam::533267232987:user/orfiajkarim"
      username = "orfiajkarim"
      groups   = ["system:masters"]
    }
  ]
  aws_auth_roles = [
    {
      rolearn  = "arn:aws:iam::533267232987:role/ec2-admin-role"
      username = "ec2-admin-role"
      groups   = ["system:masters"]
    }
  ]
}

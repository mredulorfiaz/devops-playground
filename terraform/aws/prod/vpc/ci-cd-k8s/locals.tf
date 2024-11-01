locals {
  name           = "ci-cd-k8s"
  region         = "ap-southeast-1"
  vpc_cidr       = "10.0.0.0/16"
  create_fck_nat = false
  tags = {
    GithubRepo = "devops-playground"
    GithubOrg  = "orfiaz"
  }
}

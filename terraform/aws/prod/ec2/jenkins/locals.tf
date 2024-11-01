locals {
  region               = "ap-southeast-1"
  vpc_name             = "ci-cd-k8s"
  instance_name        = "jenkins-server"
  machine_type         = "x86_64"
  subnet_name          = "*ci-cd-k8s-public*"
  instance_type        = "t3.medium"
  iam_instance_profile = "jenkins-role"
  iam_role_name        = "jenkins-role"
  policy_arns          = ["arn:aws:iam::533267232987:policy/jenkins-policy"]
}

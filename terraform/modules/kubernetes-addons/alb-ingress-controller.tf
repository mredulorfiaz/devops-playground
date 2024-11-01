locals {
  k8s_service_account_namespace = "kube-system"
  k8s_alb_service_account_name  = "alb-ingress-controller"
}

resource "aws_iam_policy" "alb_ingress_controller" {
  count       = var.deploy_alb_ingress_controller ? 1 : 0
  name        = "${var.name}-alb-ingress"
  description = "EKS ALB Ingress policy for cluster ${var.name}"
  policy      = file("${path.module}/conf/iam-policies/aws-alb-ingress-policy.json")
}

module "iam_assumable_role_ingress" {
  count                         = var.deploy_alb_ingress_controller ? 1 : 0
  source                        = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version                       = "5.47.1"
  create_role                   = true
  role_name                     = "${var.name}-alb-ingress"
  provider_url                  = replace(module.eks.cluster_oidc_issuer_url, "https://", "")
  role_policy_arns              = [aws_iam_policy.alb_ingress_controller[0].arn]
  oidc_fully_qualified_subjects = ["system:serviceaccount:${local.k8s_service_account_namespace}:${local.k8s_alb_service_account_name}"]
  depends_on                    = [module.eks]
}

resource "helm_release" "alb_ingress_controller" {
  count     = var.deploy_alb_ingress_controller ? 1 : 0
  name      = local.k8s_alb_service_account_name
  namespace = local.k8s_service_account_namespace

  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  version    = "1.10.0"
  depends_on = [module.iam_assumable_role_ingress[0]]

  values = [templatefile("${path.module}/conf/charts/alb-ingress-chart-values.yml", { role_arn = module.iam_assumable_role_ingress.this_iam_role_arn, svc_acc_name = local.k8s_alb_service_account_name, cluster_name = var.name, region = var.region, vpc_id = module.vpc.vpc_id })]
}

resource "helm_release" "alb_ingress_controller" {
  count            = var.deploy_kubernetes_dashboard ? 1 : 0
  name             = "kubernetes-dashboard"
  namespace        = "kubernetes-dashboard"
  create_namespace = true
  repository       = "https://kubernetes.github.io/dashboard/"
  chart            = "kubernetes-dashboard"
  version          = "7.10.0"

  values = [file("${path.module}/conf/charts/kubernetes-dashboard-values.yml")]
}

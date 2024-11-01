variable "region" {
  description = "Name of the AWS region (i.e: us-east-1)"
}

variable "name" {
  description = "Name of the EKS cluster"
}

variable "deploy_alb_ingress_controller" {
  type        = bool
  description = "Whether to deploy ALB ingress controller for EKS"
  default     = false
}

variable "deploy_kubernetes_dashboard" {
  type        = bool
  description = "Whether to deploy kubernetes dashboard"
  default     = true
}

variable "deploy_nginx_ingress_controller" {
  type        = bool
  description = "Whether to deploy nginx ingress controller"
  default     = true
}

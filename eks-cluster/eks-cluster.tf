#---------------------------------------------------------------
# - EKS
# Terraform module to create AWS Elastic Kubernetes (EKS) resources
# https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest
#---------------------------------------------------------------
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.8.5"
  cluster_name    = local.cluster_name
  cluster_version = var.kubernetes_version
  subnet_ids      = module.vpc.private_subnets

  cluster_endpoint_public_access = true
  enable_irsa                    = true # Determines whether to create an OpenID Connect Provider for EKS to enable IRSA - IAM roles for SA

  tags = {
    cluster = local.cluster_name
  }

  vpc_id = module.vpc.vpc_id

  eks_managed_node_group_defaults = {
    ami_type       = "AL2_x86_64" # Amazon linux 2
    instance_types = ["t3.medium"]
  }

  eks_managed_node_groups = {
    node_group = {
      min_size     = 2
      max_size     = 6
      desired_size = 2
    }
  }
}

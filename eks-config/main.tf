terraform {
  required_version = ">= 1.3.2" # eks module requirement
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">=2.20" # EKS add-ons requirement > 2.20
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.47" # EKS add-ons requirement > 5.0
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.9" # EKS add-ons requirement > 2.9
    }
  }

  # NOTE: Terraform backend is configured with terragrunt in the root terragrunt.hcl file
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = var.eks_cluster_id
      Environment = var.env_name
      Billing_tag = "Kubernetes"
    }
  }
}

# Helm provider for additional deployments
# - https://registry.terraform.io/providers/hashicorp/helm/latest/docs
provider "helm" {
  kubernetes {
    host                   = var.eks_cluster_endpoint
    cluster_ca_certificate = base64decode(var.eks_cluster_certificate_authority_data)

    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      # This requires the awscli to be installed locally where Terraform is executed
      args = ["eks", "get-token", "--cluster-name", var.eks_cluster_id]
    }
  }
}

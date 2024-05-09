variable "aws_region" {
  default     = "us-east-1"
  description = "aws region"
}

variable "env_name" {
  default     = "dev"
  description = "environment"
}

# INPUTS
variable "eks_oidc_provider" { # input
  description = "eks oidc ID provider"
}

variable "eks_cluster_endpoint" { # input
  description = "eks cluster endpoint"
}

variable "eks_cluster_certificate_authority_data" { # input
  description = "eks certificate authority data"
}

variable "eks_cluster_name" { # input
  description = "eks cluster name"
}

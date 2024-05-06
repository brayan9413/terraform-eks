terraform {
  required_version = ">= 1.2.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">=2.7.1" # add ons requirement > 2.20
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.47" # add ons requirement > 5.0
    }
    # local = {
    #   source  = "hashicorp/local"
    #   version = "~> 2.1.0"
    # }
    # null = {
    #   source  = "hashicorp/null"
    #   version = "~> 3.1.0"
    # }
    # cloudinit = {
    #   source  = "hashicorp/cloudinit"
    #   version = "~> 2.2.0"
    # }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      environment = var.env_name
    }
  }
}

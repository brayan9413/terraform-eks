terraform {
  required_version = ">= 1.3.2" # eks module requirement
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

  backend "s3" {
    bucket = "tf-state-test-brayan-salazar"
    key    = "terraform-eks/terraform.tfstate"
    region = "us-east-1"
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

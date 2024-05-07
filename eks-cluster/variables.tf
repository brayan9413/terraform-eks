variable "kubernetes_version" {
  default     = 1.29
  description = "kubernetes version"
}

variable "vpc_cidr_prefix" {
  default     = "10.0"
  description = "The first 2 octets of the IPv4 address space"
}

variable "aws_region" {
  default     = "us-east-1"
  description = "aws region"
}

variable "env_name" {
  default     = "dev"
  description = "environment"
}

#--------------------------------------------------------------------------------
# - ECR repos
#--------------------------------------------------------------------------------
locals {
  service_list = [
    "node-api-sample",
  ]
}

module "ecr_repo_service" {
  source = "../modules/ecr"

  for_each = toset(local.service_list)
  name     = "${each.key}-${var.env_name}"
}

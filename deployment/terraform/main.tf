# ==============================================================================
# Local configuration
# ==============================================================================
locals {
  app_services = var.app_services
}

# ==============================================================================
# Network Module - VPC, Subnets, Security Groups (per service)
# ==============================================================================
module "network" {
  for_each       = local.app_services
  source         = "./modules/network"
  service_name   = each.key
  container_port = each.value.container_port
  cidr_blocks    = var.allowed_ingress_cidrs
}

# ==============================================================================
# ECR Module - Creates container repository for each service
# ==============================================================================
module "ecr" {
  for_each        = local.app_services
  source          = "./modules/ecr"
  repository_name = each.value.repository_name
}

# ==============================================================================
# Logging Module - CloudWatch Logs (per service)
# ==============================================================================
module "logging" {
  for_each          = local.app_services
  source            = "./modules/logging"
  service_name      = each.key
  retention_in_days = var.log_retention_days
}

# ==============================================================================
# ECS Module - Cluster, task definition, and service (per service)
# ==============================================================================
module "ecs" {
  for_each           = local.app_services
  source             = "./modules/ecs"
  service_name       = each.key
  image              = "${module.ecr[each.key].repository_url}:${each.value.image_tag}"
  container_port     = each.value.container_port
  subnet_ids         = module.network[each.key].subnet_ids
  security_group_ids = [module.network[each.key].security_group_id]
  execution_role_arn = var.execution_role_arn
  task_role_arn      = var.task_role_arn
  log_group_name     = module.logging[each.key].log_group_name
  ecs_count          = each.value.desired_count
  region             = var.aws_region
  cpu                = each.value.cpu
  memory             = each.value.memory
}

# ==============================================================================
# Optional: Build & push service images locally (requires Docker + AWS CLI)
# ==============================================================================
resource "null_resource" "build_and_push_images" {
  for_each = var.enable_local_docker_build ? local.app_services : {}

  triggers = {
    dockerfile_sha = filesha256("${path.root}/${each.value.dockerfile}")
    image_tag      = each.value.image_tag
  }

  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-lc"]
    command     = <<-EOT
      set -euo pipefail
      registry_url="${module.ecr[each.key].repository_url}"
      registry_domain="$(echo "$registry_url" | cut -d'/' -f1)"
      aws ecr get-login-password --region ${var.aws_region} | docker login --username AWS --password-stdin "$registry_domain"
      docker build -t "${module.ecr[each.key].repository_url}:${each.value.image_tag}" -f "${abspath("${path.root}/${each.value.dockerfile}")}" "${abspath("${path.root}/${each.value.docker_context}")}"
      docker push "${module.ecr[each.key].repository_url}:${each.value.image_tag}"
    EOT
  }

  depends_on = [module.ecr]
}

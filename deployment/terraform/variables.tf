# Important AWS credentials
# DO NOT COMMIT THEM TO PUBLIC SPACE (e.g. GIT)
variable "aws_access_key_id" {
  type      = string
  sensitive = true
}

variable "aws_secret_access_key" {
  type      = string
  sensitive = true
}

variable "aws_session_token" {
  type      = string
  sensitive = true
}

variable "aws_region" {
  type    = string
  default = "us-west-2"
}

variable "execution_role_arn" {
  type        = string
  description = "IAM role ARN used by ECS tasks to pull images and publish logs"
  default     = "arn:aws:iam::589535382240:role/LabRole"
}

variable "task_role_arn" {
  type        = string
  description = "IAM role ARN assumed by the running task for application permissions"
  default     = "arn:aws:iam::589535382240:role/LabRole"
}

variable "log_retention_days" {
  type    = number
  default = 7
}

variable "allowed_ingress_cidrs" {
  description = "CIDR blocks allowed to access the services (security group ingress)."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "enable_local_docker_build" {
  description = "If true, Terraform runs local docker build/push steps for each service."
  type        = bool
  default     = false
}

variable "app_services" {
  description = "Map of application services to deploy via ECS."
  type = map(object({
    repository_name = string
    container_port  = number
    cpu             = string
    memory          = string
    desired_count   = number
    image_tag       = string
    docker_context  = string
    dockerfile      = string
  }))

  default = {
    purchase-service = {
      repository_name = "purchase-service"
      container_port  = 8080
      cpu             = "1024"
      memory          = "2048"
      desired_count   = 1
      image_tag       = "latest"
      docker_context  = "../PurchaseService"
      dockerfile      = "../PurchaseService/Dockerfile"
    }
    query-service = {
      repository_name = "query-service"
      container_port  = 8080
      cpu             = "1024"
      memory          = "2048"
      desired_count   = 1
      image_tag       = "latest"
      docker_context  = "../QueryService"
      dockerfile      = "../QueryService/Dockerfile"
    }
    mq-projection-service = {
      repository_name = "mq-projection-service"
      container_port  = 8080
      cpu             = "512"
      memory          = "1024"
      desired_count   = 1
      image_tag       = "latest"
      docker_context  = "../MqProjectionService"
      dockerfile      = "../MqProjectionService/Dockerfile"
    }
  }
}

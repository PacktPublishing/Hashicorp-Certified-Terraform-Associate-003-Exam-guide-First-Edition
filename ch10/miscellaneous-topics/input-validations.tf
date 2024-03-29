provider "aws" {
  region = "us-east-1"
}

variable "app_id" {
  type        = string
  description = "The application id for ECR repo creation."

  validation {
    condition     = length(var.app_id) == 9 && substr(var.app_id, 0, 4) == "app-"
    error_message = "The app_id value must include the prefix \"app-\" and should be 9 characters long."
  }
}

resource "aws_ecr_repository" "app_repo" {
  name                 = "${var.app_id}-repo"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
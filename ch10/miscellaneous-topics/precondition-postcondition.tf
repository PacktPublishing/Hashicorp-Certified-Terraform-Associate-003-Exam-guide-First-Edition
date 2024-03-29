data "aws_ecr_repository" "repo_data" {
  name = aws_ecr_repository.app_repo.name

  lifecycle {
    precondition {
      condition     = aws_ecr_repository.app_repo.image_tag_mutability == "IMMUTABLE"
      error_message = "The only value allowed is \"IMMUTABLE\"."
    }

    postcondition {
      condition     = substr(self.name, 10, 4) == "repo"
      error_message = "Resource suffix \"repo\" missing for the ECR repo"
    }
  }
}

output "repo_tag_mutability" {
  value = aws_ecr_repository.app_repo.image_tag_mutability

  precondition {
    condition     = aws_ecr_repository.app_repo.image_tag_mutability == "IMMUTABLE"
    error_message = "The only value allowed is \"IMMUTABLE\"."
  }

}
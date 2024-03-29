terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region = var.region
}

variable "region" {

}

resource "aws_iam_user" "test_user" {
  name = "test-aws-user"
  path = "/test/"

  tags = {
    "createdby" = "terraform"
  }
}

resource "aws_iam_access_key" "user_access_keys" {
  user = aws_iam_user.test_user.name
}

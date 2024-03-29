terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.14"
    }
  }

  required_version = ">= 1.3.1"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}
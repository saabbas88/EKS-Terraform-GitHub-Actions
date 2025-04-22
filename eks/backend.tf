terraform {
  required_version = "~> 1.10.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49.0"
    }
  }
  backend "s3" {
    bucket         = "dev-abbas-tf-bucket"
    region         = "us-east-1"
    key            = "eks/terraform.tfstate"
    dynamodb_table = "Lock-Files"
    attribute {
    name = "LockID"
    type = "S"
    }
  }
}

provider "aws" {
  region  = var.aws-region
}

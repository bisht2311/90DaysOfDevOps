#TERRAFORM BLOCK
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" #version
    }
  }
}

#PROVIDERS BLOCK
provider "aws" {
  region = var.region
}

# REMOTE BACKEND
terraform {
  backend "s3" {
    bucket         = "terraweek-state-harshit"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraweek-state-lock"
    encrypt        = true
  }
}
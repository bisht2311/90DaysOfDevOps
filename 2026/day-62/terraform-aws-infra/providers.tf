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
  region = "ap-south-1"
}


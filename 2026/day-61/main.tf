#terraform block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

#provider block
provider "aws" {
  region = "ap-south-1"
}

#resource block - S3 Bucket
resource "aws_s3_bucket" "my-bucket" {
  bucket = "terraweek-harshitbisht-s3-bucket"
}

#resource block - EC2 Instance
resource "aws_instance" "ec2-instance" {
  ami = "ami-0c7632fb77f35db43"
  instance_type = "t3.micro" # t2.micro is not available for me for free
  tags = {
    Name = "TerraWeek-Modified"
  }
}

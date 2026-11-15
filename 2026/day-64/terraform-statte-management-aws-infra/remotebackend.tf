
# S3 Bucket for Remote State
resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraweek-state-harshit"

  tags = {
    Name        = "Terraform Remote State"
    Environment = "Dev"
  }
}

# Enable S3 Bucket Versioning
resource "aws_s3_bucket_versioning" "state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

# DynamoDB Table for State Locking
resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraweek-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "Terraform State Lock"
  }
}
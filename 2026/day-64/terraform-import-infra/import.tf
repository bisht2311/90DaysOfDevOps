import {
  to = aws_s3_bucket.logs_bucket
  id = "terraweek-import-test-harshit"
}

resource "aws_s3_bucket" "logs_bucket" {
  bucket = "terraweek-import-test-harshit"

  tags = {
    Name      = "Imported bucket"
    ManagedBy = "Terraform"
  }
}
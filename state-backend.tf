provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "terragrunt_state" {
  bucket = "bucket101439840"

  tags = {
    Name        = "Terragrunt State Bucket"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "state_versioning" {
  bucket = aws_s3_bucket.terragrunt_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terragrunt_lock" {
  name         = "my-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "Terragrunt Lock Table"
    Environment = "dev"
  }
}

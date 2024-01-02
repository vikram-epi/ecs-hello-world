terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
resource "aws_s3_bucket" "terraform_state-ms-demo1" {
  bucket = "hello-world-terraform-state-morrisons-demo1"

  # Prevent accidental deletion of this S3 bucket
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state-ms-demo1" {
  bucket = aws_s3_bucket.terraform_state-ms-demo1.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}

# Enable versioning so we can see the full revision history of our state files
resource "aws_s3_bucket_versioning" "terraform_state-ms-demo" {
  bucket = aws_s3_bucket.terraform_state-ms-demo.id

  versioning_configuration {
    status = "Enabled"
  }
}



resource "aws_dynamodb_table" "terraform_locks1" {
  name         = "hello-world-state-locks-ms-demo1"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bucket1" {
  bucket        = var.bucket1_name  # Use the variable here
  force_destroy = true  # Allows bucket deletion even when it contains objects

  tags = merge(local.common_tags, {
    Name = var.bucket1_name
  })
}

resource "aws_s3_bucket_versioning" "bucket1_versioning" {
  bucket = aws_s3_bucket.bucket1.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "bucket2" {
  bucket        = var.bucket2_name  # Use the variable here
  force_destroy = true  # Allows bucket deletion even when it contains objects

  tags = merge(local.common_tags, {
    Name = var.bucket2_name
  })
}

resource "aws_s3_bucket_versioning" "bucket2_versioning" {
  bucket = aws_s3_bucket.bucket2.id
  versioning_configuration {
    status = "Enabled"
  }
}
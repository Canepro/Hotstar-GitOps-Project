# NOTE: Before running 'terraform init', ensure the S3 bucket 'hotstar-canepro1' exists.
# Create it first by running 'terraform apply' in the s3-buckets/ directory.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.25.0"
    }
  }

  # Remote state storage - requires s3-buckets module to be applied first
  backend "s3" {
    bucket = "hotstar-canepro1"
    key    = "ec2/terraform.tfstate"
    region = "us-east-1"
  }

  required_version = ">= 1.6.3"
}
provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region = "us-east-1"  # Change as needed
}

resource "aws_ecr_repository" "hotstar" {
  name = "hotstar-ecr"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = merge(local.common_tags, {
    Service = "hotstar"
  })
}

# Lifecycle policy to manage image retention and reduce storage costs
resource "aws_ecr_lifecycle_policy" "hotstar" {
  repository = aws_ecr_repository.hotstar.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Keep last 30 images"
        selection = {
          tagStatus     = "any"
          countType     = "imageCountMoreThan"
          countNumber   = 30
        }
        action = {
          type = "expire"
        }
      },
      {
        rulePriority = 2
        description  = "Expire images older than 90 days"
        selection = {
          tagStatus   = "untagged"
          countType   = "sinceImagePushed"
          countUnit   = "days"
          countNumber = 90
        }
        action = {
          type = "expire"
        }
      }
    ]
  })
}

variable "bucket1_name" {
  description = "Name of the first S3 bucket"
  type        = string
  default     = "hotstar-s3-1"
  
  validation {
    condition     = length(var.bucket1_name) >= 3 && length(var.bucket1_name) <= 63
    error_message = "Bucket name must be between 3 and 63 characters"
  }
  
  validation {
    condition     = can(regex("^[a-z0-9.-]+$", var.bucket1_name))
    error_message = "Bucket name can only contain lowercase letters, numbers, dots, and hyphens"
  }
}

variable "bucket2_name" {
  description = "Name of the second S3 bucket"
  type        = string
  default     = "hotstar-s3-2"
  
  validation {
    condition     = length(var.bucket2_name) >= 3 && length(var.bucket2_name) <= 63
    error_message = "Bucket name must be between 3 and 63 characters"
  }
  
  validation {
    condition     = can(regex("^[a-z0-9.-]+$", var.bucket2_name))
    error_message = "Bucket name can only contain lowercase letters, numbers, dots, and hyphens"
  }
}

variable "environment" {
  description = "Environment tag for the buckets"
  type        = string
  default     = "dev"
  
  validation {
    condition     = contains(["dev", "staging", "prod", "test"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod, test"
  }
}

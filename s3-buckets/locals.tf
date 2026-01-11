# Common tags for all resources in this module
locals {
  common_tags = {
    Project     = "Hotstar-GitOps"
    Environment = var.environment
    Owner       = "Canepro"
    CostCenter  = "Training"
    ManagedBy   = "Terraform"
  }
}


variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
  
  validation {
    condition     = can(regex("^[a-z]+-[a-z]+-[0-9]+$", var.region))
    error_message = "Region must be valid AWS region format (e.g., us-east-1, eu-west-1)"
  }
}

variable "vpc-name" {
  description = "VPC Name for our Jumphost server"
  type        = string
  default     = "Jumphost-vpc"
}

variable "igw-name" {
  description = "Internet Gate Way Name for our Jumphost server"
  type        = string
  default     = "hotstar-igw"
}

variable "subnet-name1" {
  description = "Public Subnet 1 Name"
  type        = string
  default     = "hotstar-subnet-public-1"
}

variable "subnet-name2" {
  description = "Subnet Name for our Jumphost server"
  type        = string
  default     = "hotstar-subnet-public-2"
}

# Private subnet name variables
variable "private_subnet_name1" {
  description = "Private Subnet 1 Name"
  type        = string
  default     = "hotstar-subnet-private-1"
}

variable "private_subnet_name2" {
  description = "Private Subnet 2 Name"
  type        = string
  default     = "hotstar-subnet-private-2"
}

variable "rt-name" {
  description = "Route Table Name for our Jumphost server"
  type        = string
  default     = "hotstar-rt-public"
}

variable "sg-name" {
  description = "Security Group for our Jumphost server"
  type        = string
  default     = "hotstar-sg"
}


variable "iam-role" {
  description = "IAM Role for the Jumphost Server"
  type        = string
  default     = "hotstar-iam-ec2-role"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance. Leave empty to use latest Amazon Linux 2023 AMI automatically."
  type        = string
  default     = "" # Empty = use data.aws_ami.amazon_linux.id (dynamic lookup)
  
  validation {
    condition     = var.ami_id == "" || can(regex("^ami-[0-9a-f]{17}$", var.ami_id))
    error_message = "AMI ID must be empty or valid AMI format (ami-xxxxxxxxxxxxxxxxx)"
  }
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.large"
  
  validation {
    condition     = can(regex("^[a-z][0-9]+\\.[a-z]+$", var.instance_type))
    error_message = "Instance type must be valid AWS format (e.g., t2.large, m5.xlarge)"
  }
}

variable "key_name" {
  description = "EC2 keypair"
  type        = string
  default     = "aws_key"   // Replace with the keypair
}

variable "instance_name" {
  description = "EC2 Instance name for the jumphost server"
  type        = string
  default     = "hotstar-ec2-jumphost"
}
#

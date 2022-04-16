variable "aws_region" {
  description = "AWS Region"
  type = string
  default = "us-east-1"
}

variable "availability_zones" {
  description = "AZs where to create EC2 instances and network resources"
  type        = list(string)
}

variable "s3_name" {
  type        = string
  description = "Name for S3 bucket"
}

variable "human_users" {
  description = "List of human user to create"
  type        = list(string)
}

variable "system_users" {
  description = "List of system users to create"
  type        = list(string)
}

variable "vpc_config" {
  description = "Config for VPC to create"
  type        = list(object({
    # VPC name
    name = string
    # CIDR block
    cidr = string
    # Template for private subnets
    private_subnet_tpl = string
    # Template for public subnets
    public_subnet_tpl  = string
  }))
}

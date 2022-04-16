variable "name" {
  description = "VPC name"
  type        = string
}

variable "availability_zones" {
  description = "AZs where to create EC2 instances and network resources"
  type        = list(string)
}

variable "private_subnet_tpl" {
  description = "Template for private subnet CIDR to create according to instance count"
  type        = string
}

variable "public_subnet_tpl" {
  description = "Template for public subnet CIDR to create according to instance count"
  type        = string
}

variable "cidr" {
  type        = string
  description = "CIDR for default VPC"
}

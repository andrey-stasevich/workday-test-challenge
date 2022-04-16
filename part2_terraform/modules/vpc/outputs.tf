# VPC Id
output "vpc_id" {
  value = aws_vpc.this.id
  }

# VPC CIDR block
output "cidr_block" {
  value = aws_vpc.this.cidr_block
}

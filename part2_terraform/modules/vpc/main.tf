# Create VPC
resource "aws_vpc" "this" {
  cidr_block = var.cidr
  tags = {
    Name = var.name
  }
}

# Elastic IP for NAT Gateway
resource "aws_eip" "nat_gateway_ip" {
  vpc   = true
}

# NAT Gateway for private subnets
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat_gateway_ip.id
  subnet_id     = aws_subnet.public[0].id
  tags = {
    Name = format("ngw-%s", var.name)
  }
}

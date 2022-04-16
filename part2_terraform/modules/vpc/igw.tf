# Create internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = format("igw-%s", var.name)
  }
}

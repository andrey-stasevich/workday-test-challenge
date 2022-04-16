# Public subnet for bastion host
resource "aws_subnet" "public" {
  for_each = local.az_map

  availability_zone = each.value
  cidr_block        = format(var.public_subnet_tpl, each.key)
  vpc_id            = aws_vpc.this.id

  tags = {
    Name = format("pub-sn-%s-%s", var.name, each.value)
  }

}

# Route table for public subnet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = format("pub-rt-%s", var.name)
  }
}

# Associate route table and public subnet
resource "aws_route_table_association" "public_route_table_association" {
  for_each = local.az_map

  subnet_id      = aws_subnet.public[each.key].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "my_private_route_table" {
  vpc_id = aws_vpc.some_custom_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "my_private_route_table"
  }

}

resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.some_custom_private_subnet)
  route_table_id = aws_route_table.my_private_route_table.id
  subnet_id      = aws_subnet.some_custom_private_subnet[count.index].id

}

resource "aws_route_table" "my_public_route_table" {
  vpc_id = aws_vpc.some_custom_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.some_custom_igw.id
  }

}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.some_custom_public_subnet)
  route_table_id = aws_route_table.my_public_route_table.id
  subnet_id      = aws_subnet.some_custom_public_subnet[count.index].id

}

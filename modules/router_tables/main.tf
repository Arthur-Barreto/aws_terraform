resource "aws_route_table" "my_private_route_table" {
  vpc_id = var.vpc_id

}

resource "aws_route_table_association" "private" {
  count          = var.private_subnet_count
  route_table_id = aws_route_table.my_private_route_table.id
  subnet_id      = var.private_subnet_ids[count.index]

}

resource "aws_route_table" "my_public_route_table" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.gateway_id
  }

}

resource "aws_route_table_association" "public" {
  count          = var.public_subnet_count
  route_table_id = aws_route_table.my_public_route_table.id
  subnet_id      = var.public_subnet_ids[count.index]

}

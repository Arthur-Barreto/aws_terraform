resource "aws_nat_gateway" "nat_gateway" {
  allocation_id     = aws_eip.web_app_eip.id
  connectivity_type = "public"
  subnet_id         = aws_subnet.some_custom_public_subnet[0].id
  tags = {
    Name = "nat_gateway"
  }
  depends_on = [aws_internet_gateway.some_custom_igw]
}

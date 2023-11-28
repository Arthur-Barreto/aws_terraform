resource "aws_internet_gateway" "some_custom_igw" {
  vpc_id = aws_vpc.some_custom_vpc.id
  tags   = var.tags_igw

}
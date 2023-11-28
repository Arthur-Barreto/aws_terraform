data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "some_custom_public_subnet" {
  count                   = var.subnet_count.public
  vpc_id                  = aws_vpc.some_custom_vpc.id
  cidr_block              = var.public_subnet_cidr_blocks[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_${count.index}"
  }

}

resource "aws_subnet" "some_custom_private_subnet" {
  count             = var.subnet_count.private
  vpc_id            = aws_vpc.some_custom_vpc.id
  cidr_block        = var.private_subnet_cidr_blocks[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "private_subnet_${count.index}"
  }

}

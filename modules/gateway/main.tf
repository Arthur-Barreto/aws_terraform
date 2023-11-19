resource "aws_internet_gateway" "some_custom_igw" {
  vpc_id = var.vpc_id
  tags   = var.tags_igw

}
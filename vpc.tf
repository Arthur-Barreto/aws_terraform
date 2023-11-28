resource "aws_vpc" "some_custom_vpc" {
  cidr_block           = var.cidr_block_vpc
  enable_dns_hostnames = true
  tags                 = var.tag_vpc

}

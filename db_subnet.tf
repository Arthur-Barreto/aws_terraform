resource "aws_db_subnet_group" "db_subnet_group" {
  name       = var.db_subnet_group_name
  subnet_ids = [for subnet in aws_subnet.some_custom_private_subnet : subnet.id]
}

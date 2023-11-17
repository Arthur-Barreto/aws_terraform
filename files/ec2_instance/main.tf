resource "aws_instance" "app_server_instance" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = [var.security_group_name]

  tags = var.tags
}

resource "aws_security_group" "ssh_security_group" {
  name        = var.name
  description = var.description

  ingress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = var.protocol
    cidr_blocks = var.cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = var.cidr_blocks
  }

}
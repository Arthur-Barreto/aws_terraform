resource "aws_security_group" "ec2_security_group" {
  name        = var.ec2_sg_name
  description = var.description
  vpc_id      = aws_vpc.some_custom_vpc.id

  ingress {
    description = "Allow all trafic through HTTP"
    from_port   = var.http_port_in
    to_port     = var.http_port_out
    protocol    = var.protocol
    cidr_blocks = var.cidr_blocks
  }

  ingress {
    description = "Allow trafic through 8000"
    from_port   = 8000
    to_port     = 8000
    protocol    = var.protocol
    cidr_blocks = var.cidr_blocks
  }

  ingress {
    description = "Allow ssh trafic"
    from_port   = var.ssh_port_in
    to_port     = var.ssh_port_end
    protocol    = var.protocol
    cidr_blocks = var.cidr_blocks
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = var.cidr_blocks
  }

  tags = var.ec2_sg_tag

}

resource "aws_security_group" "rds_security_group" {
  name        = var.rds_sg_name
  description = var.description
  vpc_id      = aws_vpc.some_custom_vpc.id

  ingress {
    description     = var.rds_sg_description
    from_port       = var.rds_port_in
    to_port         = var.rds_port_out
    protocol        = var.protocol
    security_groups = [aws_security_group.ec2_security_group.id]
  }

  tags = var.rds_tag

}

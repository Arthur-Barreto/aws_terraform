resource "aws_db_instance" "my_database" {
  allocated_storage      = var.settings.database.allocated_storage
  engine                 = var.settings.database.engine
  engine_version         = var.settings.database.engine_version
  instance_class         = var.settings.database.instance_class
  db_name                = var.settings.database.db_name
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.id
  vpc_security_group_ids = [aws_security_group.rds_security_group.id]
  skip_final_snapshot    = var.settings.database.skip_final_snapshot
  identifier             = "cloudc"
  multi_az               = false
  tags = {
    Name = "my_cloud_database"
  }
}

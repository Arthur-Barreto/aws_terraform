resource "aws_eip" "web_app_eip" {
  # count    = var.settings.web_app.count
  # instance = aws_instance.web_app[count.index].id
  domain   = "vpc"
  tags = {
    Name = "web_app_eip"
  }
}

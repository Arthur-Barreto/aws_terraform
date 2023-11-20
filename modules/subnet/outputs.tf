output "private_subnet_count" {
  value = var.subnet_count.private

}

output "private_subnet_ids" {
  value = aws_subnet.some_custom_private_subnet[*].id

}

output "public_subnet_count" {
  value = var.subnet_count.public

}

output "public_subnet_ids" {
  value = aws_subnet.some_custom_public_subnet[*].id

}

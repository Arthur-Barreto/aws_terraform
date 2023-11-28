####### Output for public key #######
output "private_key_file" {
  value = var.key_name
}

##### ip server #####
# output "web_public_ip" {
#   description = "The public IP address of the web server."
#   value       = aws_eip.web_app_eip[0].public_ip
#   depends_on  = [aws_eip.web_app_eip]

# }

# output "web_public_dns" {
#   description = "The public DNS name of the web server."
#   value       = aws_eip.web_app_eip[0].public_dns
#   depends_on  = [aws_eip.web_app_eip]

# }


##### db endpoints #####
output "db_endpoint" {
  description = "The endpoint of the RDS instance."
  value       = aws_db_instance.my_database.address

}

output "database_port" {
  description = "The port of the RDS instance."
  value       = aws_db_instance.my_database.port

}

# output "alb_dns_name" {
#   description = "The DNS name of the ALB."
#   value       = aws_lb.web_app_alb.dns_name
#   depends_on  = [aws_lb.web_app_alb]

# }

output "autoscaling_rule" {
  description = "The autoscaling rule."
  value = "${split("/", aws_lb.arthurmsb_lb.id)[1]}/${split("/", aws_lb.arthurmsb_lb.id)[2]}/${split("/", aws_lb.arthurmsb_lb.id)[3]}/targetgroup/${split("/", aws_lb_target_group.arthurmsb_target_group.arn)[1]}/${split("/", aws_lb_target_group.arthurmsb_target_group.arn)[2]}"
}
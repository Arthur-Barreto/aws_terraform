####### Output for public key #######
output "private_key_file" {
  value = var.key_name
}

##### db endpoints #####
output "db_endpoint" {
  description = "The endpoint of the RDS instance."
  value       = aws_db_instance.my_database.address

}

output "alb_dns_name" {
  description = "The DNS name of the ALB."
  value       = aws_lb.arthurmsb_lb.dns_name

}

output "autoscaling_rule" {
  description = "The autoscaling rule."
  value       = "${split("/", aws_lb.arthurmsb_lb.id)[1]}/${split("/", aws_lb.arthurmsb_lb.id)[2]}/${split("/", aws_lb.arthurmsb_lb.id)[3]}/targetgroup/${split("/", aws_lb_target_group.arthurmsb_target_group.arn)[1]}/${split("/", aws_lb_target_group.arthurmsb_target_group.arn)[2]}"
}

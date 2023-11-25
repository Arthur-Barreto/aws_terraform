resource "aws_launch_template" "launch_template" {
  name_prefix   = "web_app"
  image_id      = var.ami
  instance_type = var.settings.web_app.instance_type
  key_name      = aws_key_pair.deployer_key_pair.key_name

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.ec2_security_group.id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "web_app"
    }
  }

}

resource "aws_autoscaling_group" "arthurmsb_asg" {
  name                = var.settings.web_app.instance_type
  desired_capacity    = 2
  max_size            = 10
  min_size            = 2
  vpc_zone_identifier = [aws_subnet.some_custom_public_subnet[0].id]

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }

  timeouts {
    delete = "15m"
  }

  tag {
    key                 = "Name"
    value               = "web_app"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "arthurmsb_scale_up" {
  name                   = "web_app_scale_up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.arthurmsb_asg.name

}

resource "aws_autoscaling_policy" "arthurmsb_scale_down" {
  name                   = "web_app_scale_down"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.arthurmsb_asg.name

}

resource "aws_cloudwatch_metric_alarm" "arthurmsb_cpu_alarm_high" {
  alarm_name          = "web_app_cpu_alarm_high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "90"

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.arthurmsb_scale_up.arn]

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.arthurmsb_asg.name
  }
}

resource "aws_cloudwatch_metric_alarm" "arthurmsb_cpu_alarm_low" {
  alarm_name          = "web_app_cpu_alarm_low"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "30"

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.arthurmsb_scale_down.arn]

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.arthurmsb_asg.name
  }
}

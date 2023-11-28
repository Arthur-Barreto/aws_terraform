resource "aws_lb" "arthurmsb_lb" {
  name                       = "arthurmsblb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.ec2_security_group.id]
  subnets                    = [aws_subnet.some_custom_public_subnet[0].id, aws_subnet.some_custom_public_subnet[1].id]
  enable_deletion_protection = false

  tags = {
    Name = "arthurmsb_lb"
  }

}

resource "aws_lb_target_group" "arthurmsb_target_group" {
  name     = "arthurmsbtargetgroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.some_custom_vpc.id

  health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 15
    interval            = 30
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
  }

  tags = {
    Name = "arthurmsb_target_group"
  }

}

resource "aws_lb_listener" "application" {
  load_balancer_arn = aws_lb.arthurmsb_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.arthurmsb_target_group.arn
    type             = "forward"
  }

}

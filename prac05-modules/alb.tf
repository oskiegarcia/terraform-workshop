resource "aws_lb" "tf_demo_alb" {
  name            = "tf-demo-alb"
  subnets         = [aws_subnet.az_a_public_sub.id, aws_subnet.az_b_public_sub.id]
  security_groups = [aws_security_group.allow_http80.id]
  internal        = false
  idle_timeout    = 60
  tags = {
    Name = "tf-demo-alb"
    Owner = var.owner
    Env = "Dev"
  }
}

resource "aws_lb_target_group" "tf_demo_alb_tg" {
  name     = "tf-demo-alb-tg"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = aws_vpc.tf_demo_vpc.id
  tags = {
    name = "tf-demo-alb-tg"
    Owner = var.owner
    Env = "Dev"
  }
  stickiness {
    type            = "lb_cookie"
    enabled         = false
  }
  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 10
    timeout             = 5
    interval            = 10
    path                = "/"
    port                = 80
  }
}

resource "aws_lb_listener" "tf_demo_alb_listener" {
  load_balancer_arn = aws_lb.tf_demo_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.tf_demo_alb_tg.arn
    type             = "forward"
  }
}

resource "aws_autoscaling_attachment" "tf_demo_alb_autoscale" {
  alb_target_group_arn   = aws_lb_target_group.tf_demo_alb_tg.arn
  autoscaling_group_name = aws_autoscaling_group.tf_demo_asg.id
}
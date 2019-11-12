resource "aws_lb" "this_alb" {
  name            = var.lb_name
  subnets         = var.subnets
  security_groups = var.security_groups
  internal        = false
  idle_timeout    = 60
  tags = {
    Name = var.lb_name
    Owner = var.owner
    Env = var.environment
  }
}

resource "aws_lb_target_group" "this_alb_tg" {
  name     = var.tg_name
  port     = "80"
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  tags = {
    name = var.tg_name
    Owner = var.owner
    Env = var.environment
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

resource "aws_lb_listener" "this_lb_listener" {
  load_balancer_arn = aws_lb.this_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.this_alb_tg.arn
    type             = "forward"
  }
}

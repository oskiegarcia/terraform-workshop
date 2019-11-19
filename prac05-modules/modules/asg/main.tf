
resource "aws_launch_configuration" "this_asg_config" {
  image_id = var.image_id
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = var.security_groups
  user_data = file(var.user_data_filename)
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "this_asg" {
  launch_configuration    = aws_launch_configuration.this_asg_config.id
  vpc_zone_identifier = var.vpc_zone_identifier
  health_check_type       = "ELB"
  min_size                = var.min_size
  max_size                = var.max_size
  tag {
    key = "asg-name"
    propagate_at_launch = true
    value = var.asg_name
  }
}

resource "aws_autoscaling_attachment" "tf_demo_alb_autoscale" {
  alb_target_group_arn   = var.alb_target_group_arn
  autoscaling_group_name = aws_autoscaling_group.this_asg.id
}

data "aws_instances" "nodes" {
  depends_on = [ "aws_autoscaling_group.this_asg" ]
  instance_tags = {
    asg-name = var.asg_name
  }
}

# Specify the provider and access details
provider "aws" {
  region = var.aws_region
  profile = var.account_profile
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}

resource "aws_launch_configuration" "asg_config" {
  image_id = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = aws_key_pair.generated_key.key_name
  security_groups = [aws_security_group.allow_ssh.id, aws_security_group.allow_http80.id]
  user_data = file("install_softwares.sh")
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "tf_demo_asg" {
  launch_configuration    = aws_launch_configuration.asg_config.id
  vpc_zone_identifier = [aws_subnet.az_a_public_sub.id,aws_subnet.az_b_public_sub.id]
  health_check_type       = "ELB"
  min_size                = "2"
  max_size                = "2"
  tag {
    key = "tf-demo-asg"
    propagate_at_launch = true
    value = "tf-demo-asg"
  }
}

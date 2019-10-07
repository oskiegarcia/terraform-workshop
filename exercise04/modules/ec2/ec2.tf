resource "aws_instance" "main" {
  count = var.size

  ami                  = var.image_id
  instance_type        = var.instance_type
  key_name             = aws_key_pair.main.key_name
  iam_instance_profile = var.iam_instance_profile_name

  vpc_security_group_ids = var.security_groups

  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.is_public
  user_data_base64            = var.user_data_base64

  root_block_device {
    volume_type           = var.root_vol_type
    volume_size           = var.root_ebs_size
    delete_on_termination = var.delete_ebs_on_termination
  }

  volume_tags = {
    Name         = var.name
    Env          = terraform.workspace
    ServiceGroup = var.service_group
    managedby    = var.managedBy
  }

  tags = {
    Name         = var.name
    Env          = terraform.workspace
    ServiceGroup = var.service_group
    managedby    = var.managedBy
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_key_pair" "main" {
  key_name   = "${var.name}-key"
  public_key = var.public_key
}

resource "aws_ebs_volume" "extra" {
  count = var.extra_volume != "" ? var.size : 0

availability_zone = var.availability_zone
size              = var.extra_volume
type              = var.extra_volume_type

tags = {
Name         = var.name
Env          = terraform.workspace
ServiceGroup = var.service_group
managedby    = var.managedBy
}
}

resource "aws_volume_attachment" "extra" {
count = var.extra_volume != "" ? var.size : 0

volume_id   = aws_ebs_volume.extra.*.id[count.index]
instance_id = aws_instance.main.*.id[count.index]
device_name = var.extra_volume_devicename
}

data "aws_region" "current" {
}


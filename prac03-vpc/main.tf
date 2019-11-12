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

resource "aws_instance" "terra_demo1" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = aws_key_pair.generated_key.key_name
  vpc_security_group_ids = [aws_security_group.public_instance.id]
  subnet_id = aws_subnet.az_a_public_sub.id
  tags = {
    Name = "tf-demo-instance1-az_1a_public_sub"
    Owner = var.owner
    Env = var.environment
  }
}

resource "aws_instance" "terra_demo2" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = aws_key_pair.generated_key.key_name
  vpc_security_group_ids = [aws_security_group.private_instance.id]
  subnet_id = aws_subnet.az_a_private_sub.id
  tags = {
    Name = "tf-demo-instance2-az_1a_private_sub"
    Owner = var.owner
    Env = var.environment
  }
}
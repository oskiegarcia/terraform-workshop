# Specify the provider and access details
provider "aws" {
  region = var.aws_region
  profile = var.account_profile
}

resource "tls_private_key" "tf_demo_pvt_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.tf_demo_pvt_key.public_key_openssh
}

resource "local_file" "tf_demo_pem" {
  content  = tls_private_key.tf_demo_pvt_key.private_key_pem
  filename = "${path.module}/tf_demo.pem"
}

resource "aws_security_group" "instance" {
  name = "tf demo sg"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "ssh login"
  }
  tags ={
    Name="tf_demo_sg"
    Owner = var.owner
    Env = var.environment
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "terra_demo" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = aws_key_pair.generated_key.key_name
  vpc_security_group_ids=[aws_security_group.instance.id]
tags = {
    Name = "tf-demo-ec2"
    Owner = var.owner
    Env = var.environment
  }
}
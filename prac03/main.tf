# Specify the provider and access details
provider "aws" {
  region = var.aws_region
  profile = var.account_profile
}


resource "tls_private_key" "tf_demo_pvt_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name = var.key_name
  public_key = tls_private_key.tf_demo_pvt_key.public_key_openssh
}

resource "local_file" "tf_demo_pem" {
  content = tls_private_key.tf_demo_pvt_key.private_key_pem
  filename = "${path.module}/tf_demo.pem"
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
  instance_type = "t2.micro"
  key_name = aws_key_pair.generated_key.key_name
  vpc_security_group_ids = [aws_security_group.public_instance.id]
  subnet_id = aws_subnet.az_1a_public_sub.id
  tags = {
    Name = "tf-demo-instance1-az_1a_public_sub"
    Owner = var.owner
    Env = "Dev"
  }
}

resource "aws_instance" "terra_demo2" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = aws_key_pair.generated_key.key_name
  vpc_security_group_ids = [aws_security_group.private_instance.id]
  subnet_id = aws_subnet.az_1a_private_sub.id
  tags = {
    Name = "tf-demo-instance2-az_1a_private_sub"
    Owner = var.owner
    Env = "Dev"
  }
}
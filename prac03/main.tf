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

resource "aws_instance" "terra_demo" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  tags = {
    Name = "tf-demo-ec2"
    Owner = "Dream Team"
  }
}
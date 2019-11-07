# Specify the provider and access details
provider "aws" {
  region = var.aws_region
  profile = var.account_profile
}

resource "aws_instance" "terra_demo" {
  ami = "ami-0c199cae95cea87f0"
  instance_type = "t2.micro"
}
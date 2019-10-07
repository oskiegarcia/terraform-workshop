# Specify the provider and access details
provider "aws" {
  region = "${var.aws_region}"
}

# Create a VPC to launch our instances into
resource "aws_vpc" "myvpc" {
  cidr_block = "10.1.0.0/16"
  enable_dns_hostnames = "true"

  tags = {
    Name = "terraform-workshop"
    Env  = "${terraform.workspace}"
  }
}

# Create an internet gateway to give our subnet access to the outside world
resource "aws_internet_gateway" "myigw" {
  vpc_id = "${aws_vpc.myvpc.id}"
}
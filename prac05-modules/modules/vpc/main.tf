resource "aws_vpc" "this_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = var.name
    Owner = var.owner
    Env = var.environment
  }
}

resource "aws_internet_gateway" "tf_demo_igw" {
  vpc_id = aws_vpc.this_vpc.id
}

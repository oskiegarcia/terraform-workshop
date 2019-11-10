resource "aws_vpc" "tf_demo_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "tf-demo-aws-vpc"
    Owner = var.owner
    Env = "Dev"
  }
}

resource "aws_internet_gateway" "tf_demo_igw" {
  vpc_id = aws_vpc.tf_demo_vpc.id
}


/*
  Public Subnet - Availability Zone A
*/
resource "aws_subnet" "az_a_public_sub" {
  vpc_id = aws_vpc.tf_demo_vpc.id

  cidr_block = var.public_subnet_cidr
  availability_zone = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "tf-demo-public-subnet"
    Owner = var.owner
    Env = "Dev"
  }
}

resource "aws_route_table" "az_a_public_rtb" {
  vpc_id = aws_vpc.tf_demo_vpc.id

  route {
    cidr_block = var.everywhere_cidr
    gateway_id = aws_internet_gateway.tf_demo_igw.id
  }

  tags = {
    Name = "public-route-table"
    Owner = var.owner
    Env = "Dev"
  }
}

resource "aws_route_table_association" "az_a_public_rtba" {
  subnet_id = aws_subnet.az_a_public_sub.id
  route_table_id = aws_route_table.az_a_public_rtb.id
}

/*
  Private Subnet - Availability Zone A
*/

resource "aws_eip" "nat_eip" {
  tags = {
    Name = "tf-demo-eip"
    Owner = var.owner
    Env = "Dev"
  }

}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = aws_subnet.az_a_public_sub.id

  tags = {
    Name = "tf-demo-nat"
    Owner = var.owner
    Env = "Dev"
  }
}

resource "aws_subnet" "az_a_private_sub" {
  vpc_id = aws_vpc.tf_demo_vpc.id

  cidr_block = var.private_subnet_cidr
  availability_zone = "${var.aws_region}a"
  map_public_ip_on_launch = false

  tags = {
    Name = "tf-demo-private-subnet"
    Owner = var.owner
    Env = "Dev"
  }
}

resource "aws_route_table" "az_a_private_rtb" {
  vpc_id = aws_vpc.tf_demo_vpc.id

  route {
    cidr_block = var.everywhere_cidr
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "private-route-table"
    Owner = var.owner
    Env = "Dev"
  }
}

resource "aws_route_table_association" "az_1a_private_rtba" {
  subnet_id = aws_subnet.az_a_private_sub.id
  route_table_id = aws_route_table.az_a_private_rtb.id
}
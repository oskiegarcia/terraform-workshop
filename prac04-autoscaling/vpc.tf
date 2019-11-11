resource "aws_vpc" "tf_demo_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "tf-demo-aws-vpc"
    Owner = var.owner
    Env = var.environment
  }
}

resource "aws_internet_gateway" "tf_demo_igw" {
  vpc_id = aws_vpc.tf_demo_vpc.id
}


/*
  Public Subnet - Availability Zone a
*/
resource "aws_subnet" "az_a_public_sub" {
  vpc_id = aws_vpc.tf_demo_vpc.id

  cidr_block = var.public_subnet_cidr_az_a
  availability_zone = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "tf-demo-public-subnet-az-a"
    Owner = var.owner
    Env = var.environment
  }
}

resource "aws_route_table" "az_a_public_rtb" {
  vpc_id = aws_vpc.tf_demo_vpc.id

  route {
    cidr_block = var.everywhere_cidr
    gateway_id = aws_internet_gateway.tf_demo_igw.id
  }

  tags = {
    Name = "public-route-table-az-a"
    Owner = var.owner
    Env = var.environment
  }
}

resource "aws_route_table_association" "az_a_public_rtba" {
  subnet_id = aws_subnet.az_a_public_sub.id
  route_table_id = aws_route_table.az_a_public_rtb.id
}


/*
  Public Subnet - Availability Zone b
*/
resource "aws_subnet" "az_b_public_sub" {
  vpc_id = aws_vpc.tf_demo_vpc.id

  cidr_block = var.public_subnet_cidr_az_b
  availability_zone = "${var.aws_region}b"
  map_public_ip_on_launch = true

  tags = {
    Name = "tf-demo-public-subnet-az-b"
    Owner = var.owner
    Env = var.environment
  }
}

resource "aws_route_table" "az_b_public_rtb" {
  vpc_id = aws_vpc.tf_demo_vpc.id

  route {
    cidr_block = var.everywhere_cidr
    gateway_id = aws_internet_gateway.tf_demo_igw.id
  }

  tags = {
    Name = "public-route-table-az-b"
    Owner = var.owner
    Env = var.environment
  }
}

resource "aws_route_table_association" "az_b_public_rtba" {
  subnet_id = aws_subnet.az_b_public_sub.id
  route_table_id = aws_route_table.az_b_public_rtb.id
}

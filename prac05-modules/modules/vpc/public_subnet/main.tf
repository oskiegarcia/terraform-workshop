resource "aws_subnet" "this_subnet" {
  vpc_id = var.vpc_id

  cidr_block = var.subnet_cidr_block
  availability_zone = var.az
  map_public_ip_on_launch = true

  tags = {
    Name = var.name
    Owner = var.owner
    Env = var.environment
  }
}

resource "aws_route_table" "this_rtb" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name = "${var.name}-route-table"
    Owner = var.owner
    Env = var.environment
  }
}

resource "aws_route_table_association" "az_a_public_rtba" {
  subnet_id = aws_subnet.this_subnet.id
  route_table_id = aws_route_table.this_rtb.id
}

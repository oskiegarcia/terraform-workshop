resource "aws_security_group" "public_instance" {
  name = "tf-demo-public-sg"
  vpc_id = aws_vpc.tf_demo_vpc.id
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.everywhere_cidr]
    description = "ssh login"
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [var.everywhere_cidr]
  }
  tags = {
    Name = "tf-demo-public-sg"
    Owner = var.owner
    Env = var.environment
  }
}

resource "aws_security_group" "private_instance" {
  vpc_id = aws_vpc.tf_demo_vpc.id
  name = "tf-demo-private-sg"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.public_subnet_cidr]
    description = "ssh login"
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [var.everywhere_cidr]
  }

  tags = {
    Name = "tf-demo-private-sg"
    Owner = var.owner
    Env = var.environment
  }
}


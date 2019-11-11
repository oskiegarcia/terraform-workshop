resource "aws_security_group" "allow_ssh" {
  name = "tf-demo-allow-ssh-sg"
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
    Name = "tf-demo-allow-ssh-sg"
    Owner = var.owner
    Env = var.environment
  }
}

resource "aws_security_group" "allow_http80" {
  name = "tf-demo-allow-http80-sg"
  vpc_id = aws_vpc.tf_demo_vpc.id
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [var.everywhere_cidr]
    description = "http access"
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [var.everywhere_cidr]
  }
  tags = {
    Name = "tf-demo-allow-http80-sg"
    Owner = var.owner
    Env = var.environment
  }
}



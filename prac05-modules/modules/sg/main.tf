resource "aws_security_group" "this_sg" {
  name = var.name
  vpc_id = var.vpc_id
  ingress {
    from_port = var.inbound_port_from
    to_port = var.inbound_port_to
    protocol = "tcp"
    cidr_blocks = var.inbound_cidr
    description = var.inbound_desc
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.name
    Owner = var.owner
    Env = var.environment
  }
}


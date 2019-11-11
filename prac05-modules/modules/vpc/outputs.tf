output "igw_id" {
  value = aws_internet_gateway.tf_demo_igw.id
}

output "vpc_id" {
  value = aws_vpc.this_vpc.id
}
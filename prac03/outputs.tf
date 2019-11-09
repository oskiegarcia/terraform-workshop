
output "instance_1_ec2_public_ip" {
  value = aws_instance.terra_demo1.public_ip
}

output "instance_2_ec2_private_ip" {
  value = aws_instance.terra_demo2.private_ip
}

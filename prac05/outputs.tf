output "ec2_ami" {
  value = aws_instance.terra_demo.ami
}

output "ec2_public_ip" {
  value = aws_instance.terra_demo.public_ip
}

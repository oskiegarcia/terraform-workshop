resource "tls_private_key" "tf_demo_pvt_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name = var.key_name
  public_key = tls_private_key.tf_demo_pvt_key.public_key_openssh
}

resource "local_file" "tf_demo_pem" {
  content = tls_private_key.tf_demo_pvt_key.private_key_pem
  filename = "${path.module}/tf_demo.pem"
}
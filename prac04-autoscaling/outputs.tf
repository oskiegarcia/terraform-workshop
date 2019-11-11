output "public-ips" {
  value = data.aws_instances.nodes.public_ips
}

output "alb-dns" {
  value = aws_lb.tf_demo_alb.dns_name
}

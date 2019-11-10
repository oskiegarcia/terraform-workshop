output "public-ips" {
  value = data.aws_instances.nodes.public_ips
}
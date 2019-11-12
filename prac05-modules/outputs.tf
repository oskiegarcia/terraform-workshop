output "public-ips" {
  value = module.tf_demo_asg.public-ips
}

output "alb-dns" {
  value = module.tf_demo_alb.alb-dns
}

output "tg_arn" {
  value = aws_lb_target_group.this_alb_tg.arn
}

output "alb-dns" {
  value = aws_lb.this_alb.dns_name
}
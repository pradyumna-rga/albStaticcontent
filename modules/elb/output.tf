
output "alb_dns_name" {
  description = "To display at console or invoke DNS name of the ALB from modules"
  value       = aws_lb.alb.alb.lb_dns_name
}


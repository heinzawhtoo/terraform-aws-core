output "instance_id" {
  description = "ID of the web EC2 instance."
  value       = aws_instance.web.id
}

output "alb_dns_name" {
  description = "DNS name of the application load balancer."
  value       = aws_lb.web.dns_name
}

output "alb_arn" {
  description = "ARN of the application load balancer."
  value       = aws_lb.web.arn
}

output "instance_role_arn" {
  description = "ARN of the EC2 IAM role."
  value       = aws_iam_role.ec2.arn
}

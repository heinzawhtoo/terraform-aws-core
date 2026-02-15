output "vpc_id" {
  description = "VPC ID for dev environment."
  value       = module.network.vpc_id
}

output "public_subnet_1_id" {
  description = "Public subnet 1 ID for dev environment."
  value       = module.network.public_subnet_1_id
}

output "public_subnet_2_id" {
  description = "Public subnet 2 ID for dev environment."
  value       = module.network.public_subnet_2_id
}

output "private_subnet_id" {
  description = "Private subnet ID for dev environment."
  value       = module.network.private_subnet_id
}

output "web_instance_id" {
  description = "Web EC2 instance ID for dev environment."
  value       = module.compute.instance_id
}

output "alb_dns_name" {
  description = "Public DNS name of the ALB for dev environment."
  value       = module.compute.alb_dns_name
}

output "instance_role_arn" {
  description = "IAM role ARN for dev EC2 instance."
  value       = module.compute.instance_role_arn
}

output "s3_bucket_id" {
  description = "S3 bucket ID for dev environment."
  value       = module.storage.bucket_id
}

output "key_pair_name" {
  description = "Key pair name attached to EC2 instance."
  value       = module.compute.effective_key_pair_name
}

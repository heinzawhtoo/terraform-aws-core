output "vpc_id" {
  description = "VPC ID for dev environment."
  value       = module.network.vpc_id
}

output "public_subnet_id" {
  description = "Public subnet ID for dev environment."
  value       = module.network.public_subnet_id
}

output "web_instance_id" {
  description = "Web EC2 instance ID for dev environment."
  value       = module.compute.instance_id
}

output "web_public_ip" {
  description = "Web EC2 public IP for dev environment."
  value       = module.compute.public_ip
}

output "s3_bucket_id" {
  description = "S3 bucket ID for dev environment."
  value       = module.storage.bucket_id
}

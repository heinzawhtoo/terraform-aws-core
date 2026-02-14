variable "aws_region" {
  description = "AWS region for deployment."
  type        = string
}

variable "environment" {
  description = "Environment name."
  type        = string
}

variable "project_name" {
  description = "Project name used in resource naming."
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR for this environment."
  type        = string
}

variable "public_subnet_1_cidr" {
  description = "CIDR for public subnet 1."
  type        = string
}

variable "public_subnet_2_cidr" {
  description = "CIDR for public subnet 2."
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR for private subnet."
  type        = string
}

variable "availability_zone_1" {
  description = "Primary availability zone."
  type        = string
}

variable "availability_zone_2" {
  description = "Secondary availability zone."
  type        = string
}

variable "ssh_allowed_cidr" {
  description = "Allowed CIDR block for SSH ingress."
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 web server."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for web server."
  type        = string
}

variable "key_name" {
  description = "Optional key pair name for EC2 SSH access."
  type        = string
  default     = null
}

variable "bucket_name" {
  description = "Globally unique S3 bucket name."
  type        = string
}

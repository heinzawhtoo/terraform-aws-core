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

variable "create_key_pair" {
  description = "Create an EC2 key pair from provided public key."
  type        = bool
  default     = false
}

variable "key_pair_name" {
  description = "Name of key pair to use (existing or newly created)."
  type        = string
  default     = null
}

variable "public_key" {
  description = "Public key material when create_key_pair is true."
  type        = string
  default     = null
}

variable "bucket_name" {
  description = "Globally unique S3 bucket name."
  type        = string
}

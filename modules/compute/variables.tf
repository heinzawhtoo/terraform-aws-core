variable "name_prefix" {
  description = "Prefix used for naming compute resources."
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for ALB target group."
  type        = string
}

variable "private_subnet_id" {
  description = "Private subnet ID where the EC2 instance is deployed."
  type        = string
}

variable "alb_subnet_ids" {
  description = "Two public subnet IDs for internet-facing ALB."
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "Security group ID attached to the ALB."
  type        = string
}

variable "web_security_group_id" {
  description = "Security group ID attached to the EC2 instance."
  type        = string
}

variable "key_name" {
  description = "Optional EC2 key pair name for SSH access."
  type        = string
  default     = null
}

variable "tags" {
  description = "Common tags applied to resources."
  type        = map(string)
  default     = {}
}

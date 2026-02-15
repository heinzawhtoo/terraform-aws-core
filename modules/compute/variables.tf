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

variable "create_key_pair" {
  description = "Create a new EC2 key pair from provided public key."
  type        = bool
  default     = false
}

variable "key_pair_name" {
  description = "Name to use for a new key pair (when create_key_pair=true) or existing key pair name (when create_key_pair=false)."
  type        = string
  default     = null

  validation {
    condition     = var.create_key_pair || var.key_pair_name != null
    error_message = "When create_key_pair is false, key_pair_name must be set to an existing EC2 key pair name (or set create_key_pair=true)."
  }
}

variable "public_key" {
  description = "Public key material for aws_key_pair when create_key_pair=true."
  type        = string
  default     = null

  validation {
    condition     = !var.create_key_pair || var.public_key != null
    error_message = "When create_key_pair is true, public_key must be provided."
  }
}

variable "tags" {
  description = "Common tags applied to resources."
  type        = map(string)
  default     = {}
}

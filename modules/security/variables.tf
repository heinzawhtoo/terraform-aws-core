variable "name_prefix" {
  description = "Prefix used for naming security resources."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the security group is created."
  type        = string
}

variable "ssh_allowed_cidr" {
  description = "Allowed CIDR for SSH access."
  type        = string
}

variable "tags" {
  description = "Common tags applied to resources."
  type        = map(string)
  default     = {}
}

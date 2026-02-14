variable "name_prefix" {
  description = "Prefix used for naming security resources."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where security groups are created."
  type        = string
}

variable "ssh_allowed_cidr" {
  description = "Allowed CIDR for SSH access to web instance SG."
  type        = string
}

variable "tags" {
  description = "Common tags applied to resources."
  type        = map(string)
  default     = {}
}

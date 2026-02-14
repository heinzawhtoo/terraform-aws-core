variable "name_prefix" {
  description = "Prefix used for naming network resources."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "public_subnet_1_cidr" {
  description = "CIDR block for the first public subnet."
  type        = string
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for the second public subnet."
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet."
  type        = string
}

variable "availability_zone_1" {
  description = "Availability Zone for the first public subnet and private subnet."
  type        = string
}

variable "availability_zone_2" {
  description = "Availability Zone for the second public subnet."
  type        = string
}

variable "tags" {
  description = "Common tags applied to resources."
  type        = map(string)
  default     = {}
}

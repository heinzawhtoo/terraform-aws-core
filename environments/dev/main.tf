terraform {
  required_version = ">= 1.4.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

locals {
  name_prefix = "${var.project_name}-${var.environment}"

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

module "network" {
  source = "../../modules/network"

  name_prefix          = local.name_prefix
  vpc_cidr             = var.vpc_cidr
  public_subnet_1_cidr = var.public_subnet_1_cidr
  public_subnet_2_cidr = var.public_subnet_2_cidr
  private_subnet_cidr  = var.private_subnet_cidr
  availability_zone_1  = var.availability_zone_1
  availability_zone_2  = var.availability_zone_2
  tags                 = local.common_tags
}

module "security" {
  source = "../../modules/security"

  name_prefix      = local.name_prefix
  vpc_id           = module.network.vpc_id
  ssh_allowed_cidr = var.ssh_allowed_cidr
  tags             = local.common_tags
}

module "compute" {
  source = "../../modules/compute"

  name_prefix           = local.name_prefix
  ami_id                = var.ami_id
  instance_type         = var.instance_type
  vpc_id                = module.network.vpc_id
  private_subnet_id     = module.network.private_subnet_id
  alb_subnet_ids        = [module.network.public_subnet_1_id, module.network.public_subnet_2_id]
  alb_security_group_id = module.security.alb_security_group_id
  web_security_group_id = module.security.web_security_group_id
  create_key_pair       = var.create_key_pair
  key_pair_name         = var.key_pair_name
  public_key            = var.public_key
  tags                  = local.common_tags
}

module "storage" {
  source = "../../modules/storage"

  name_prefix = local.name_prefix
  bucket_name = var.bucket_name
  tags        = local.common_tags
}

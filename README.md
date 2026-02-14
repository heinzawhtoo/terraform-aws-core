# Terraform AWS Core

Simple AWS Terraform project with two environments (`dev` and `prod`) using reusable modules.

## Architecture

Per environment, this stack now creates:

- 1 VPC
- 2 public subnets (for internet-facing ALB)
- 1 private subnet (for EC2 web server)
- 1 Internet Gateway
- 1 NAT Gateway (private subnet egress)
- 1 Application Load Balancer
- 1 EC2 instance (web server) in private subnet, registered to ALB target group
- IAM Role + Instance Profile for EC2 (with AmazonSSMManagedInstanceCore)
- Security groups:
  - ALB SG: HTTP/HTTPS from `0.0.0.0/0`
  - Web SG: HTTP only from ALB SG, SSH from configured `ssh_allowed_cidr`
- 1 S3 bucket

## Project layout

```text
.
├── environments
│   ├── dev
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── dev.tfvars.example
│   └── prod
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── prod.tfvars.example
└── modules
    ├── compute   # EC2 + ALB + target group + IAM role/profile
    ├── network   # VPC + public/private subnets + IGW + NAT + routing
    ├── security  # ALB SG + web SG
    └── storage   # S3 bucket
```

## Usage

1. Copy and edit tfvars example files:

```bash
cp environments/dev/dev.tfvars.example environments/dev/dev.tfvars
cp environments/prod/prod.tfvars.example environments/prod/prod.tfvars
```

2. Run Terraform for dev:

```bash
cd environments/dev
terraform init
terraform plan -var-file=dev.tfvars
```

3. Run Terraform for prod:

```bash
cd environments/prod
terraform init
terraform plan -var-file=prod.tfvars
```

## Notes

- `.tfvars` files are gitignored. Keep real values out of version control.
- For ALB, two public subnets in different AZs are used (`availability_zone_1`, `availability_zone_2`).
- EC2 is intentionally private; access the app via `alb_dns_name` output.

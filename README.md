# Terraform AWS Core

Simple AWS Terraform project with two environments (`dev` and `prod`) using reusable modules.

## What is included

- One VPC per environment
- One public subnet per environment
- One EC2 web server per environment
- One security group per environment
  - HTTP/HTTPS open to public
  - SSH allowed only from configured CIDR in tfvars
- One S3 bucket per environment

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
    ├── compute
    ├── network
    ├── security
    └── storage
```

## Usage

1. Copy and edit tfvars example:

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

> `.tfvars` files are gitignored. Use your own values and do not hardcode sensitive data in code.

# Terraform Environments

## Using `terraform.tfvars.example`

Each environment may include a `terraform.tfvars.example` file with recommended
defaults. Copy it to `terraform.tfvars` (or supply values via `-var-file`) before
running `terraform plan` or `terraform apply`.

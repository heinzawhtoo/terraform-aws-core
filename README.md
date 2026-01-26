# AWS Infrastructure Baseline

This repository contains a baseline AWS infrastructure setup using Terraform.
It is designed as a clean, modular foundation that can be extended for real-world
workloads.

## Goals

- Establish a production-style Terraform repository structure
- Separate environments (dev / prod)
- Use reusable modules
- Follow infrastructure-as-code best practices

## Scope

- Infrastructure only (no application code)
- Incremental implementation by phase
- Focus on clarity, maintainability, and safety

## Planned Components

- Networking (VPC, subnets, routing)
- Security (IAM, security groups)
- Compute (EC2 / container-ready baseline)

## Environments

- `dev` — development and experimentation
- `prod` — production-style configuration (non-destructive)

## Status

🧭 Architecture and repository structure defined.  
🚧 Networking baseline implementation in progress.


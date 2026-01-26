# AWS Infrastructure Baseline

This repository contains a baseline AWS infrastructure setup using Terraform.
It is designed as a clean, modular foundation that can be extended for real-world
workloads.

## Goals

- Establish a production-style Terraform repository structure
- Separate environments (dev / prod)
- Use reusable modules
- Follow infrastructure-as-code best practices

## Scope (Initial Phase)

- No application code
- No CI/CD automation
- No cloud resources created yet

This phase focuses only on structure and design.

## Planned Components

- Networking (VPC, subnets, routing)
- Compute (EC2 / container-ready baseline)
- Security (IAM, security groups)

## Environments

- `dev` — development and experimentation
- `prod` — production-style configuration (non-destructive)

## Status

🧭 Architecture and repository structure defined.
Implementation will proceed incrementally.


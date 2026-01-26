# Architecture Decisions

This document records high-level decisions for the Terraform AWS Core repository.
The goal is clarity and consistency, not premature optimization.

## General Principles

- Infrastructure is defined using Terraform only
- No manual changes in the AWS console
- Prefer simplicity over feature completeness
- Design for readability and maintainability

## Repository Structure

- `terraform/modules` contains reusable building blocks
- `terraform/environments` separates environment-specific configuration
- Shared logic lives in modules, not environments

## Environment Strategy

- `dev` is used for learning, experimentation, and validation
- `prod` represents a production-style layout but is treated carefully
- Environments are isolated through configuration, not copy-paste

## State Management (Planned)

- Remote state will be used
- State locking is required
- Backend configuration will be environment-specific

## Security Considerations

- Least privilege is preferred
- Credentials are never committed to the repository
- Sensitive values will be handled via variables or secret stores

## Out of Scope (For Now)

- CI/CD pipelines
- Application deployment
- Advanced networking (Transit Gateway, multi-account)

These may be added later once the foundation is stable.


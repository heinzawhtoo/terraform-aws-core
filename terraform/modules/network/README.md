# Network Module

This module creates a baseline VPC with public and private subnets, plus an
internet gateway and a public route table for the public subnets.

## Private Subnet Egress

Private subnets created by this module do **not** include NAT gateways or
private route tables. This means instances in private subnets are isolated from
outbound internet access by default.

If you need outbound access from private subnets, add NAT gateways and private
route tables (one per AZ or per environment requirements) and associate those
route tables with the private subnets.

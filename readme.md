# AWS Secure EC2 Infrastructure with SSM Access

## Table of Contents
- [Overview](#overview)
- [Architecture](#architecture)
- [Prerequisites](#prerequisites)
- [Setup Instructions](#setup-instructions)
  - [Configuration](#configuration)
  - [Deployment Steps](#deployment-steps)
- [Access Instructions](#access-instructions)
  - [Connecting to EC2](#connecting-to-ec2)
- [Security](#security)
- [Cleanup](#cleanup)
- [Troubleshooting](#troubleshooting)

## Overview
This Terraform configuration establishes a secure AWS infrastructure that creates an EC2 instance accessible only through AWS Systems Manager (SSM), eliminating the need for SSH access or bastion hosts.

## Architecture
The infrastructure includes:
- VPC with private subnets
- EC2 instance with SSM access
- Security Groups
- VPC Endpoints for SSM connectivity:
  - SSM endpoint
  - SSM messages endpoint
  - EC2 messages endpoint

## Prerequisites
- AWS CLI installed and configured
- Terraform 
- AWS Systems Manager Session Manager plugin
- Appropriate AWS permissions

## Setup Instructions

### Configuration
1. Clone this repository to your local machine.
2. Create a `locals.tf` file in the root directory.

### Deployment Steps
1. Initialize Terraform:
    ```bash
    terraform init
    ```
2. Review the execution plan:
    ```bash
    terraform plan
    ```
3. Apply the configuration:
    ```bash
    terraform apply
    ```

## Access Instructions

### Connecting to EC2
To connect to the EC2 instance:

1. Install the Session Manager plugin

2. Start a session using AWS CLI:
    ```bash
    aws ssm start-session --target i-xxxxxxxxxxxxxxxxx
    ```

## Security
The infrastructure implements several security best practices:
- ✅ No public IP addresses
- ✅ No inbound SSH access
- ✅ Private subnets only
- ✅ Minimal security group rules
- ✅ SSM access only
- ✅ No direct internet access

## Cleanup
To remove all created resources:
```bash
terraform destroy
```
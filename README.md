# DevOps Playground

This repository contains Terraform modules and Ansible playbooks for setting up and configuring infrastructure on AWS. The project includes custom Terraform modules for EC2 instances, VPC, NAT gateways, IAM roles, and Kubernetes add-ons. Additionally, an Ansible playbook is provided to automate the configuration of a Jenkins server.

## Overview

- **Terraform Modules**: Reusable modules for AWS infrastructure, including EC2, VPC, NAT gateway, IAM roles, and Kubernetes add-ons.
- **AWS Infrastructure Setup**: A complete infrastructure setup using Terraform modules to deploy resources on AWS.
- **Ansible Playbook**: A playbook to configure Jenkins on a server, automating common setup tasks and configurations.

## Components

### Terraform Modules

The following modules were developed as part of this project:

1. **EC2 Module**: Creates EC2 instances with configurable parameters for instance type, security groups, key pairs, and more.
2. **VPC Module**: Provisions a Virtual Private Cloud with configurable subnets, route tables, and internet gateway.
3. **FCK-NAT Module**: Deploys NAT gateways to allow private subnet instances to connect to the internet while remaining unreachable from the outside.
4. **IAM Role Module**: Creates IAM roles with configurable policies to manage permissions securely.
5. **Kubernetes Add-ons Module**: Adds essential Kubernetes add-ons to an existing EKS cluster to enhance functionality.

### AWS Infrastructure Setup

The infrastructure setup leverages the above Terraform modules to create a cohesive AWS environment. This setup includes:

- EC2 instances for various application workloads
- A secure, segmented VPC network
- NAT gateway for internet access from private subnets
- IAM roles with least privilege principles
- Kubernetes add-ons for EKS clusters

### Ansible Jenkins Setup

The Ansible playbook automates the configuration of a Jenkins server with the following steps:

- Installs necessary packages and dependencies
- Sets up Jenkins, configures security, and manages plugins
- Ensures the server is optimized and secured for production use

## Usage

1. **Terraform Setup**

    To set up the infrastructure, navigate to the directory containing the Terraform files and run:

   ```bash
    terraform init
    terraform plan -out=plan.out
    terraform apply
   
Ensure that you have configured your AWS credentials and adjusted the variables as needed in the terraform.tfvars file.

2. **Ansible Configuration**
    
After setting up the infrastructure, configure the Jenkins server using Ansible:

    ```bash
    ansible-playbook  jenkins.yml

Update the `inventory` file with proper jenkins IP addresss


## Requirements
- Terraform >= 1.3.2
- Ansible >= 2.17
- AWS CLI configured with appropriate permissions
- SSH Access to the EC2 instances for Ansible

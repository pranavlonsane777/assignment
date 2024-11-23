# S3 Bucket Content Listing Service

This repository contains two implementations of a service that lists the contents of an S3 bucket. The service exposes a RESTful HTTP endpoint to retrieve the content of an S3 bucket path. It also includes Terraform code to provision the necessary AWS infrastructure and deploy the service.

## Table of Contents

1. [Overview](#overview)  
2. [Architecture](#architecture)  
3. [Features](#features)  
4. [Implementation Approaches](#implementation-approaches)  
   - [EC2-Based Approach](#ec2-based-approach)  
   - [Lambda-Based Approach](#lambda-based-approach)  
5. [Steps to Deploy](#steps-to-deploy)  
   - [Terraform Commands](#terraform-commands)  
6. [Design Decisions and Assumptions](#design-decisions-and-assumptions)  
7. [Demo](#demo)  
8. [Directory Structure](#directory-structure)  
9. [Conclusion](#conclusion)  

---

## Overview

This project solves the problem of listing the contents of an S3 bucket directory via an HTTP GET request. It provides two deployment options: using an EC2 instance or an AWS Lambda function.

The service supports:
- Listing top-level and nested contents of an S3 bucket.
- Returning results in JSON format.
- Handling non-existing paths gracefully with error messages.
- HTTPS deployment for secure communication (bonus feature).

---

## Architecture

### EC2 Approach
1. A Flask-based Python application deployed on an EC2 instance.
2. Uses IAM roles for S3 bucket access.
3. Exposes the service via an Application Load Balancer for HTTPS.

### Lambda Approach
1. A Python AWS Lambda function triggered by API Gateway.
2. API Gateway handles HTTPS termination.
3. Lightweight and cost-effective, utilizing AWS-managed infrastructure.

---

## Features

- **S3 Content Listing:** List the contents of a specified S3 path.
- **Error Handling:** Handles invalid paths with appropriate error responses.
- **HTTPS Support:** Secure communication using SSL/TLS.
- **Terraform Automation:** Fully automated infrastructure provisioning.

---

## Implementation Approaches

### EC2-Based Approach

**Components:**
- A Python Flask application (`app.py`) hosted on an EC2 instance.
- Infrastructure includes VPC, subnets, security groups, IAM roles, and an ALB for HTTPS.
  
**Steps:**
1. Deploy infrastructure using Terraform (`infra/ec2-approach`).
2. SSH into the EC2 instance, deploy the application, and start the service.
3. Access the service at the ALB endpoint.

---

### Lambda-Based Approach

**Components:**
- AWS Lambda function (`lambda_function.py`) triggered by API Gateway.
- Infrastructure includes API Gateway, S3 bucket, and IAM roles.

**Steps:**
1. Package the Lambda function using the `build.sh` script.
2. Deploy the infrastructure and Lambda function using Terraform (`infra/lambda-approach`).
3. Access the service at the API Gateway endpoint.

---

## Steps to Deploy

### Prerequisites

- Terraform installed (`>= v1.0.0`).
- AWS CLI installed and configured with appropriate permissions.
- Python environment for EC2 deployment.

### Terraform Commands

1. Initialize Terraform:
   ```bash
   terraform init
2. Validate the configuration:
   ```bash
   terraform validate
3. Generate an execution plan:
   ```bash
   terraform plan
4. Apply the changes:
   ```bash
   terraform apply

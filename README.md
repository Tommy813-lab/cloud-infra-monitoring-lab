# AWS EC2, S3, and CloudWatch Infrastructure Setup

## Overview

This repository contains Terraform code and scripts to provision and manage a simple AWS infrastructure environment that includes:

- **EC2 instances** for running applications
- **S3 buckets** for storage and hosting static files
- **CloudWatch** setup for monitoring and alerting

The goal is to have a reproducible, automated environment using Infrastructure as Code (IaC).

---

## Architecture Diagram

![Architecture Diagram](docs/architecture-diagram.png)

*Description:* This diagram illustrates the core AWS resources provisioned:

- EC2 instances running in a private/public subnet  
- S3 buckets used for storage and static website hosting  
- CloudWatch monitoring EC2 metrics and sending alerts  
- IAM roles and policies enabling secure access

*(You can create this diagram using [draw.io](https://app.diagrams.net/), [Lucidchart](https://www.lucidchart.com/), or any diagramming tool. Save it as `docs/architecture-diagram.png`.)*

---

## Components

### EC2

- Launches one or more EC2 instances with configured security groups and IAM roles  
- Instances configured via userdata scripts to bootstrap and install necessary software

### S3

- Buckets created for general storage and optionally static website hosting  
- Versioning and lifecycle policies configured (optional, based on your config)

### CloudWatch

- Metrics monitored include CPU usage, disk IO, network traffic for EC2  
- Alarms configured to notify on thresholds (CPU spikes, instance downtime, etc.)  
- CloudWatch Logs can be integrated for application logs if needed

---

## Getting Started

### Prerequisites

- AWS CLI configured with appropriate permissions  
- Terraform installed (v1.0+)  
- IAM user/role with rights to create EC2, S3, CloudWatch, and IAM resources

### Usage

1. Clone this repo:  
```bash
git clone https://github.com/Tommy813-lab/aws-ec2-s3-cloudwatch-infra.git

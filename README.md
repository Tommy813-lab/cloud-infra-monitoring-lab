🌐 Cloud Infrastructure Monitoring Lab
📖 Overview

This project demonstrates how to design, deploy, and monitor AWS infrastructure with automation, observability, and alerting pipelines.

The lab provisions an EC2 instance that simulates a production workload, collects system metrics with the CloudWatch Agent, visualizes performance through dashboards, and triggers alarms that notify operators in real time via SNS.

It’s a practical example of how to move from just running cloud resources → to actively managing and monitoring them like an SRE or Cloud Engineer would.

🎯 Scenario

A small startup runs a lightweight API service on EC2. During traffic spikes:

CPU and memory usage climb past safe thresholds.

Without monitoring, service degradation goes unnoticed until customers complain.

With this setup:

Metrics flow into CloudWatch.

Dashboards visualize health in real time.

Alarms trigger when thresholds are crossed.

Alerts are delivered instantly via email/SMS to operators.

This lab represents the first building block of Site Reliability Engineering (SRE): turning raw infrastructure into observable systems.

🏗️ Architecture
flowchart TD
    A[Developer Git Commit] --> B[Terraform Apply via Script]
    B --> C[EC2 Instance Provisioned]
    C --> D[CloudWatch Agent Installed]
    D --> E[CloudWatch Metrics Collected]
    E --> F[CloudWatch Dashboards]
    E --> G[CloudWatch Alarms]
    G --> H[SNS Topic]
    H --> I[Email/SMS Alert to Operator]

⚙️ Tech Stack

AWS EC2 – Compute resource simulating workload

Terraform – Infrastructure provisioning as code

Bash – Deployment scripting & automation

CloudWatch Agent – Metrics collection (CPU, memory, disk, network)

CloudWatch Dashboards – Visual monitoring panels

CloudWatch Alarms – Threshold-based detection

SNS – Real-time notifications

📂 Repository Structure
cloud-infra-monitoring-lab/
├── terraform/                # Infrastructure as Code
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── scripts/                  # Deployment & teardown automation
│   ├── deploy.sh
│   └── teardown.sh
├── agent/                    # CloudWatch Agent configs
│   └── cloudwatch-config.json
├── dashboards/               # Dashboard JSON definitions
│   └── ec2-dashboard.json
├── screenshot/               # Dashboard & alert screenshots
└── README.md                 # Project documentation

🚀 Deployment Guide

Clone this repo

git clone https://github.com/Tommy813-lab/cloud-infra-monitoring-lab.git
cd cloud-infra-monitoring-lab


Provision Infrastructure with Terraform

cd terraform
terraform init
terraform plan
terraform apply -auto-approve


Deploy CloudWatch Agent

./scripts/deploy.sh


Generate Load (simulate traffic spike)

ab -n 10000 -c 100 http://<EC2_PUBLIC_IP>/


Observe Results

Dashboards update in real time.

Alarms fire when CPU > threshold.

SNS sends notifications to email/SMS.

📡 Metrics Flow
flowchart LR
   A[EC2 Instance] --> B[CloudWatch Agent]
   B --> C[CloudWatch Metrics]
   C --> D[Dashboards]
   C --> E[Alarms]
   E --> F[SNS Topic]
   F --> G[Email / SMS Notification]

📊 Example Dashboard

CPU Utilization (%)

Memory Usage (%)

Disk I/O

Network In/Out (bytes)

Dashboards combine these metrics into a single operational view so engineers can diagnose performance at a glance.

✅ Success Criteria

 EC2 instance provisioned via Terraform

 CloudWatch Agent streams system metrics

 Dashboards show live performance graphs

 Alarm fires when CPU > threshold

 SNS notification delivered to operator

🧭 Learning Outcomes

By completing this lab you’ll gain experience with:

Infrastructure as Code (Terraform modules)

Cloud monitoring & alerting with CloudWatch

Automation workflows using Bash

Designing operational dashboards

Creating feedback loops between infrastructure and humans

🔮 Next Steps

Expand to Auto Scaling Groups & Load Balancers

Add cost monitoring with AWS Budgets + SNS

Integrate CI/CD pipeline for Terraform deployment

Add IAM least-privilege roles & security checks

📌 About

This project proves hands-on ability to:

Automate provisioning with Terraform

Configure monitoring that supports operations

Build end-to-end alerting pipelines for real workloads

It’s designed as a portfolio project for Cloud/SRE roles.

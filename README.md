Cloud Infrastructure Monitoring Lab
📖 Overview

This lab simulates a real-world monitoring scenario in AWS:

An EC2 instance simulates a production workload under variable traffic.

Terraform and Bash scripts automate provisioning and configuration.

CloudWatch Agent collects system metrics (CPU, memory, disk, network).

Alarms are configured for high CPU utilization.

SNS topics send real-time alerts to subscribers (e.g., email/SMS).

CloudWatch dashboards visualize system health for operations teams.

The goal: showcase how to design, deploy, and monitor a resilient cloud workload with alerting pipelines that can scale.

🎯 Scenario

Imagine a startup running a lightweight API service on a single EC2 instance. During traffic spikes:

CPU usage can shoot past safe thresholds.

Without monitoring, the service would degrade unnoticed.

With this lab, alerts fire instantly, dashboards highlight the bottleneck, and operators can react before customers are impacted.

This repo demonstrates the first building block of Site Reliability Engineering (SRE).

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

Bash – Deployment scripting & triggers

CloudWatch Agent – System metrics collector

CloudWatch Dashboards – Visual monitoring panels

CloudWatch Alarms – Event detection & alerting

SNS – Alert delivery pipeline

📂 Repository Structure
cloud-infra-monitoring-lab/
├── terraform/                # Infrastructure code (EC2, IAM, CloudWatch, SNS)
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── scripts/                  # Deployment & setup scripts
│   ├── deploy.sh
│   └── teardown.sh
├── agent/                    # CloudWatch Agent config
│   └── cloudwatch-config.json
├── dashboards/               # JSON definitions for dashboards
│   └── ec2-dashboard.json
└── README.md                 # Project documentation

🚀 Deployment Workflow

Clone repo to local machine.

Run Terraform script to provision EC2, IAM roles, CloudWatch alarms, SNS.

Bootstrap CloudWatch Agent via deploy.sh.

Generate traffic load (Apache Bench / stress tool).

Observe:

Dashboard updates in real-time.

Alarm triggers when CPU > threshold.

SNS sends notification to your inbox/phone.

📊 Example Dashboard
graph LR
    A[CPU Utilization] -->|Alarm Threshold| B[Alarm Trigger]
    A --> C[CloudWatch Dashboard]
    D[Memory Usage] --> C
    E[Disk I/O] --> C
    F[Network Traffic] --> C


Dashboards track CPU, Memory, Disk, and Network metrics side-by-side for fast diagnosis.

✅ Success Criteria

 EC2 instance provisioned via Terraform.

 CloudWatch Agent streams system metrics.

 Dashboards show live performance graphs.

 Alarm fires when CPU > threshold.

 Operator receives SNS notification.


Configure monitoring in a way that actually supports operations.

Design an end-to-end alerting pipeline that any SRE/Cloud team would want.

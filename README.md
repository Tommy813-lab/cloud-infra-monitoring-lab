🔧 Cloud Infrastructure Monitoring Lab

A hands-on AWS lab that brings together EC2, CloudWatch, CloudWatch Agent, SNS, and custom alarms to build real-world monitoring systems for cloud engineers.



🔥 Scenario: Charles' Infrastructure Health Dashboard

Charles is supporting a growing cloud application and needs to proactively detect performance issues and outages across EC2 instances. This lab demonstrates how to:

Collect in-depth EC2 system metrics

Trigger alarms on CPU, memory, and disk thresholds

Push alerts to email or SMS via SNS

Create custom CloudWatch dashboards

Respond fast when things go sideways

This is production-style monitoring—no training wheels.

⚙️ Architecture Overview

🔹 Key Services:

Service

Purpose

EC2

Host running monitored workloads

CloudWatch

Metrics, logs, dashboards, alarms

CloudWatch Agent

Pushes custom metrics (CPU, memory, disk)

SNS

Notification pipeline

IAM

Roles and permissions

📊 Diagram

+---------------------+
|     Admin/User      |
+----------+----------+
           |
           v
+----------+----------+
|   CloudWatch        |
| + Dashboards        |
| + Alarms            |
+----------+----------+
           ^
           |
+----------+----------+
|   SNS Topic         |
|  (Email/SMS Alerts) |
+----------+----------+
           ^
           |
+----------+----------+
| CloudWatch Agent    |
| (On EC2 Instance)   |
+----------+----------+
           ^
           |
+----------+----------+
|       EC2 Instance  |
+---------------------+

🚀 What You'll Set Up

EC2 Instance (Amazon Linux 2) with CloudWatch Agent

IAM Role with permissions to publish metrics

Install & Configure CloudWatch Agent for CPU, Memory, Disk

CloudWatch Alarms with SNS notifications

Email or SMS Alerts via Amazon SNS

Dashboards to visualize instance health in real time

📁 Repo Structure

.
├── ec2-setup.sh              # Script to install and start CloudWatch agent
├── agent-config.json         # CloudWatch Agent config
├── alarm-templates.json      # Example CloudWatch alarm JSON
├── sns-setup.sh              # SNS topic + subscription script
├── dashboard.json            # Example CloudWatch dashboard
├── README.md
└── cloud-monitoring-architecture.png

🔐 Security Tips

Use least-privilege IAM roles

Restrict SNS topics to approved accounts

Enable logging for all SNS deliveries

Protect dashboard access via IAM policies

📉 Cost Breakdown (Low Usage)

Service

Estimated Monthly Cost

EC2 (t2.micro)

~$8

CloudWatch Metrics

Free tier + $0.30/month

SNS Notifications

~$0.50 (1K messages)

🧠 Why This Lab Rocks

Real-world setup used in production

Great for monitoring apps, APIs, or EC2 fleets

Reusable templates and scripts

Perfect portfolio project for interviews

🧑‍💻 About Charles

Charles is a cloud support engineer in training building hands-on AWS labs that go beyond tutorials. This project showcases operational awareness, automation, and monitoring discipline in modern cloud environments.

📊 Related Projects

s3-cloudfront-secure-static-site — Secure static site with HTTPS and CDN

aws-ec2-s3-cloudwatch-infra — General EC2 + S3 Infra Lab

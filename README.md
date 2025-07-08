☁️ AWS EC2, S3 & CloudWatch Monitoring Lab
Cloud Infrastructure Lab | EC2 provisioning, CloudWatch monitoring, S3 integration, and alerting — built for real-world, remote-ready reliability.

🔧 Project Overview
This project simulates a production-ready AWS environment with:

✅ EC2 provisioning

✅ S3 bucket integration

✅ CloudWatch monitoring & custom alarms

✅ Email notifications via SNS

✅ Log collection & dashboarding

✅ Bash scripts for automation

It reflects core tasks a Cloud Support Engineer or Junior Cloud Engineer would handle in a live AWS environment.

🧠 Why This Project Matters
I created this lab to demonstrate real, hands-on skills in AWS infrastructure monitoring — from setup to automation. It's structured to mimic cloud support scenarios seen at enterprise scale.

📐 Architecture
pgsql
Copy code
+-----------------+         +-------------------+
|  EC2 Instance   | <-----> | CloudWatch Agent  |
|  (Amazon Linux) |         +-------------------+
|  High CPU Load  |               |
+--------+--------+               v
         |                +-------------------+
         |                | CloudWatch Alarms |
         |                +-------------------+
         |                        |
         v                        v
+----------------+       +-------------------+
| S3 Bucket       | <----| CloudWatch Logs   |
| for data/assets |       +-------------------+
+----------------+                |
                                  v
                         +-------------------+
                         |   SNS Topic       |
                         | Email Notification|
                         +-------------------+
🚀 Features
Feature	Description
🔧 EC2 Setup	Provisioned instance w/ CloudWatch agent
📦 S3 Bucket	Used for logs or asset storage
📈 CloudWatch Metrics	CPU utilization, memory, etc.
🔔 Alarms & Notifications	Triggers email when thresholds are hit
📝 Logs	Monitored and exported for analysis
📊 Dashboard Ready	Custom metrics and visualizations
💻 Bash Scripting	Infrastructure scripts to automate setup

📂 File Structure
graphql
Copy code
aws-ec2-s3-cloudwatch-infra/
├── alarms/                  # JSON config for CloudWatch alarms
├── logs/                    # Example CloudWatch logs
├── scripts/                 # Bash automation scripts
├── cloudwatch/              # Agent configs, metrics
├── docs/                    # Architecture diagrams, notes
├── lambda/                  # Placeholder for future automation
├── README.md                # You're reading it
🧪 How to Use
Clone the repo

bash
Copy code
git clone https://github.com/Tommy813-lab/aws-ec2-s3-cloudwatch-infra.git
cd aws-ec2-s3-cloudwatch-infra
Launch EC2 Instance

Install & Configure CloudWatch Agent

bash
Copy code
./scripts/install-cloudwatch-agent.sh
Deploy Alarms

bash
Copy code
aws cloudwatch put-metric-alarm --cli-input-json file://alarms/ec2-highcpu-alarm.json
Test & Monitor in CloudWatch Console

🧰 Tech Stack
AWS EC2, S3, CloudWatch, IAM, SNS

Amazon Linux 2

Bash

AWS CLI

JSON (for alarm configs)

📬 Email Alerts
✅ When CPU usage exceeds the threshold, you'll receive an SNS-triggered email alert to your configured address. Just like you would in production.

🎯 Who This Is For
This project is designed for:

Aspiring Cloud Engineers

Cloud Support roles

Ops/Infra students

Anyone prepping for AWS interviews or certifications

🧠 Lessons Learned
IAM permissions for agents and alarms must be scoped correctly.

Monitoring is critical for reliability — especially under unpredictable CPU spikes.

Infrastructure as Code (IAC) is next — Terraform version coming soon.

🔗 Related Projects
aws-s3-cloudfront-static-site: Zero-server static web hosting

aws-terraform-monitoring: Coming soon!

📎 Author
Charles (Tommy) Bucher
Aspiring Cloud Engineer | AWS Certified | Linux & Infra Enthusiast
GitHub: @Tommy813-lab

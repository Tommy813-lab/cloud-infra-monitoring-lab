☁️ AWS EC2, S3 & CloudWatch Monitoring Lab
By Charles — Aspiring Cloud Engineer

🧠 Scenario: Real-World AWS Monitoring for Cloud Support
Imagine you’re a Cloud Support Engineer on-call for a critical production system. Your job? Make sure the EC2 instances run smoothly, logs are collected properly, and if CPU spikes or other issues happen, you get notified immediately so you can act fast.

This lab simulates exactly that: provisioning EC2 with CloudWatch monitoring, storing logs on S3, setting up alarms with SNS email alerts — everything automated to reflect enterprise-grade AWS environments.

📐 Architecture Diagram
mermaid
Copy code
flowchart TD
    EC2[EC2 Instance<br>(Amazon Linux 2)] --> CloudWatchAgent[CloudWatch Agent]
    CloudWatchAgent -->|Metrics & Logs| CloudWatchLogs[CloudWatch Logs]
    CloudWatchLogs --> S3[S3 Bucket<br>(Log Storage)]
    CloudWatchAgent --> CloudWatchAlarms[CloudWatch Alarms]
    CloudWatchAlarms --> SNS[SNS Topic<br>(Email Notifications)]
🔧 Project Overview
This project covers:

✅ EC2 instance provisioning with CloudWatch agent installed

✅ S3 bucket for storing logs and assets

✅ CloudWatch monitoring with CPU, memory metrics, custom alarms

✅ Automated email notifications via SNS

✅ Bash scripts for easy setup and teardown

✅ Ready-made dashboards and logs for monitoring and auditing

📁 File Structure
python
Copy code
aws-ec2-s3-cloudwatch-infra/
├── alarms/          # JSON alarm configs for CloudWatch
├── cloudwatch/      # Agent configs & custom metrics
├── docs/            # Diagrams, notes
├── lambda/          # Future automation placeholders
├── logs/            # Sample log files
├── scripts/         # Bash setup/teardown automation
└── README.md        # This file
🚀 How to Use
Clone the repo

bash
Copy code
git clone https://github.com/Tommy813-lab/aws-ec2-s3-cloudwatch-infra.git
cd aws-ec2-s3-cloudwatch-infra
Launch and configure EC2

bash
Copy code
./scripts/install-cloudwatch-agent.sh
Deploy alarms

bash
Copy code
aws cloudwatch put-metric-alarm --cli-input-json file://alarms/ec2-highcpu-alarm.json
Monitor logs & alarms

Use CloudWatch console dashboards

Receive email alerts when thresholds exceed

🧰 Technologies Used
AWS EC2 (Amazon Linux 2)

AWS S3 (Log Storage)

AWS CloudWatch (Metrics, Logs, Alarms)

AWS SNS (Email Alerts)

Bash scripting

AWS CLI & JSON configs

📬 Alerts That Matter
You’ll get a real email notification anytime your EC2 instance’s CPU usage spikes beyond the threshold — mimicking production alerting scenarios.

🎯 Who This Is For
Aspiring Cloud Engineers

Cloud Support & Operations roles

Infrastructure students prepping for AWS certifications

Anyone wanting real-world AWS monitoring practice

🧠 Lessons Learned
IAM permissions must be locked down but functional

Monitoring and alerting are critical to uptime and troubleshooting

Automating monitoring setup reduces human error

Infrastructure-as-Code (Terraform) is next on my roadmap

🔗 Related Projects
aws-s3-cloudfront-static-site: Static website hosting with global delivery

aws-terraform-monitoring: Terraform-based monitoring coming soon!

📎 About Me
Charles (Tommy) Bucher
Aspiring Cloud Engineer | AWS Certified | Linux & Infrastructure Enthusiast
GitHub: @Tommy813-lab

🧠 cloud-infra-monitoring-lab
A hands-on, production-style AWS monitoring lab for Cloud Support Engineers and aspiring Infra Pros. This project simulates real-world monitoring of a web app running on EC2, complete with metrics, custom dashboards, CloudWatch alarms, and SNS notifications. Built to help you sharpen your cloud troubleshooting instincts and respond to incidents before they become outages.

📌 Scenario
You’re a Cloud Support Engineer at a mid-size e-commerce company.
Your team just launched a marketing campaign that’s driving unexpected traffic to the web app. You’ve been tasked with setting up a proactive monitoring system to:

Track EC2 health, CPU usage, memory, and disk

Alert on high CPU before user complaints start

Notify the on-call engineer via SNS if anything’s fishy

Build dashboards so leadership can brag about “uptime metrics”

This repo is your response. 🚨

🧰 What’s Inside
Feature	Description
EC2 Monitoring Setup	Launch & configure EC2 instance with Apache and CloudWatch Agent
CloudWatch Agent Config	Pulls CPU, memory, disk, and more (not just the basics!)
CloudWatch Alarms	Custom alarms for high CPU usage (80%+)
SNS Notifications	Sends alerts to email/SMS when alarms are triggered
Dashboards	Visuals for EC2 metrics — ready for NOC/management

🧱 Architecture
pgsql
Copy
Edit
+---------------------+            +-----------------------+
|  User Traffic       |  ───────▶  |  EC2 Web Server       |
|  (Website Access)   |            |  (Apache + CW Agent)  |
+---------------------+            +-----------------------+
                                            │
                                            ▼
                            +-------------------------------+
                            | Amazon CloudWatch             |
                            | - Metrics (CPU, Memory, Disk) |
                            | - Alarms                      |
                            +-------------------------------+
                                            │
                                            ▼
                            +-------------------------------+
                            | Amazon SNS                    |
                            | - Email/SMS Alert to On-call  |
                            +-------------------------------+
🚀 How to Deploy
1. 🔧 Launch EC2 and SSH In
bash
Copy
Edit
aws ec2 run-instances \
  --image-id ami-0abcdef1234567890 \
  --instance-type t2.micro \
  --key-name my-key \
  --security-groups my-sg
SSH into it:

bash
Copy
Edit
ssh ec2-user@<your-ec2-public-ip>
2. 🧪 Install Apache + CloudWatch Agent
bash
Copy
Edit
sudo yum update -y
sudo yum install -y httpd amazon-cloudwatch-agent
sudo systemctl start httpd
sudo systemctl enable httpd
3. 📈 Configure CloudWatch Agent
Use the provided cloudwatch-agent-config.json:

bash
Copy
Edit
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
  -a fetch-config -m ec2 -c file:cloudwatch-agent-config.json -s
4. 🔔 Create Alarms + SNS
Example CPU Alarm:

bash
Copy
Edit
aws cloudwatch put-metric-alarm \
  --alarm-name HighCPUUtilization \
  --metric-name CPUUtilization \
  --namespace AWS/EC2 \
  --statistic Average \
  --period 300 \
  --threshold 80 \
  --comparison-operator GreaterThanThreshold \
  --dimensions Name=InstanceId,Value=<your-instance-id> \
  --evaluation-periods 1 \
  --alarm-actions arn:aws:sns:us-east-1:123456789012:MyTopic
✅ Success Criteria
✅ Alerts when CPU exceeds 80%

✅ You receive an email or SMS within seconds

✅ Dashboards show real-time metrics

✅ You feel like a CloudWatch ninja 🥷

📚 Skills Demonstrated
EC2 provisioning & Linux troubleshooting

Installing and configuring CloudWatch Agent

Creating custom CloudWatch alarms

SNS setup for email/mobile notifications

Building visual monitoring dashboards

💡 Real-World Use Cases
Preventive alerting during scaling events

Monitoring memory leaks or CPU hogs

Teaching junior SREs or support engineers

Interview-ready project to prove you're cloud-ready

🔥 About Me
👨‍💻 Charles – Aspiring Cloud Engineer

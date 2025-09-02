🧠 Cloud Infra Monitoring Lab

Hands-on AWS monitoring lab for Cloud Support Engineers and aspiring Infrastructure Pros.
Simulate real-world monitoring of a web app running on EC2, with custom metrics, dashboards, CloudWatch alarms, and SNS notifications. Sharpen your troubleshooting instincts and catch incidents before they become outages.

📌 Scenario

You are a Cloud Support Engineer at a mid-size e-commerce company. A marketing campaign is driving sudden traffic spikes. Your task:

Monitor EC2 health: CPU, memory, disk usage.

Alert on high CPU before users complain.

Notify the on-call engineer via SNS.

Build dashboards for leadership to showcase uptime metrics.

Your mission: Proactive monitoring with real-world AWS tooling. 🚀

🧰 Features & Tools
Feature	Description
EC2 Monitoring Setup	Launch EC2 instance with Apache and CloudWatch Agent
CloudWatch Agent Config	Tracks CPU, memory, disk, and more (beyond default metrics)
CloudWatch Alarms	Trigger alerts on high CPU usage (>80%)
SNS Notifications	Email/SMS alerts for on-call engineers
Dashboards	Real-time visuals of EC2 metrics for NOC/management
🧱 Architecture Diagram
         +-------------------+
         |   User Traffic    |
         | (Website Access)  |
         +---------+---------+
                   |
                   ▼
         +-------------------+
         |  EC2 Web Server   |
         | (Apache + CW Agent)|
         +---------+---------+
                   |
                   ▼
         +-------------------+
         |   Amazon CloudWatch|
         | - Metrics         |
         | - Alarms          |
         +---------+---------+
                   |
                   ▼
         +-------------------+
         |       SNS         |
         | - Email/SMS Alert |
         +-------------------+


Logic Flow:

Users generate traffic → EC2 processes requests.

CloudWatch Agent collects metrics in real-time.

CloudWatch evaluates thresholds → triggers alarms.

SNS sends alerts → on-call engineer receives notification.

Dashboards visualize system health.

🚀 Deployment Steps
1️⃣ Launch EC2 & SSH
aws ec2 run-instances \
  --image-id ami-0abcdef1234567890 \
  --instance-type t2.micro \
  --key-name my-key \
  --security-groups my-sg

ssh ec2-user@<EC2_PUBLIC_IP>

2️⃣ Install Apache & CloudWatch Agent
sudo yum update -y
sudo yum install -y httpd amazon-cloudwatch-agent
sudo systemctl start httpd
sudo systemctl enable httpd

3️⃣ Configure CloudWatch Agent
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
  -a fetch-config -m ec2 -c file:cloudwatch-agent-config.json -s

4️⃣ Create CloudWatch Alarms & SNS Notifications

Example: High CPU Alarm

aws cloudwatch put-metric-alarm \
  --alarm-name HighCPUUtilization \
  --metric-name CPUUtilization \
  --namespace AWS/EC2 \
  --statistic Average \
  --period 300 \
  --threshold 80 \
  --comparison-operator GreaterThanThreshold \
  --dimensions Name=InstanceId,Value=<INSTANCE_ID> \
  --evaluation-periods 1 \
  --alarm-actions arn:aws:sns:us-east-1:123456789012:MyTopic

✅ Success Criteria

Alerts trigger when CPU > 80%.

Email/SMS notifications received immediately.

Dashboards update in near real-time.

You feel like a CloudWatch ninja 🥷.

📚 Skills Demonstrated

EC2 provisioning & Linux troubleshooting

Installing & configuring CloudWatch Agent

Creating custom CloudWatch alarms

Setting up SNS notifications

Building visual dashboards

💡 Real-World Use Cases

Preventive alerting during traffic spikes or scaling events

Detecting memory leaks or CPU hogs before outages

Training junior SREs/support engineers

Interview-ready proof of cloud proficiency

🔥 About Me

Charles – Aspiring Cloud Engineer
Hands-on experience automating EC2 provisioning and monitoring using Infrastructure-as-Code and scripting. Demonstrates proficiency in:

Automated EC2 provisioning from Git commits using Bash scripts

Real-time performance monitoring with CloudWatch

Building alerting & notification systems with SNS
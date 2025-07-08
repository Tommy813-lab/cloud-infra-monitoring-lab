# 🛠️ AWS Monitoring & Support Lab

Welcome to the **AWS Monitoring & Support Lab** — a clean, no-nonsense toolkit for building, monitoring, and maintaining reliable AWS infrastructure using scripts, dashboards, and real-world support patterns.

This repo focuses on scripting and automation without Terraform or IaC frameworks — just practical tools to help monitor systems, detect problems fast, and respond even faster.

---

## 📁 Lab Structure

### 🔔 `cloudwatch/`
- `alarms/` — Pre-configured alarm setups (CPU, disk, memory, status checks)
- `dashboards/` — JSON-based CloudWatch dashboards for at-a-glance metrics
- `logs/` — Scripts and configs for log retention, filtering, and export

### 💻 `ec2/`
- `monitoring-scripts/` — PowerShell & Bash scripts for instance monitoring
- `status-checks/` — Scripts to verify EC2 health and perform auto-remediation

### 🤖 `support-tools/`
- `automated-responses/` — Triggered actions like restarts, alerts, tagging
- `incident-playbooks/` — Easy-to-follow steps for diagnosing and resolving common AWS support issues

### 🔐 `iam/`
- `roles-policies/` — Prebuilt monitoring-focused IAM roles and least-privilege policies

### ⚙️ `scripts/`
- `powershell/` — Admin scripts for Windows EC2 and local testing
- `bash/` — Linux-based tools and automation helpers

### 📚 `docs/`
- `architecture/` — Diagrams, system flow, and setup logic
- `troubleshooting/` — Real-world issues and how they were solved

---

## 💡 Why This Exists

This project is built to practice and showcase real AWS operations skills — not just theory. It's all about:

- Getting **hands-on** with EC2, CloudWatch, IAM, and scripting
- Learning to **monitor, alert, and auto-fix** common cloud issues
- Keeping it **simple and script-driven** without heavy tools or frameworks

---


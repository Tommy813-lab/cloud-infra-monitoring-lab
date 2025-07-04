#!/bin/bash

# ============================================
# AWS EC2 & S3 Destroy Script - Bash
# ============================================
# Make sure AWS CLI is installed and configured (aws configure)

# ----------- Configurable Variables ----------
REGION="us-east-1"

# ----------- User Input ----------------------
read -p "Enter the EC2 Instance ID to terminate: " INSTANCE_ID
read -p "Enter the S3 Bucket name to delete: " S3_BUCKET

# ----------- Terminate EC2 Instance ----------
echo "Terminating EC2 instance $INSTANCE_ID..."
aws ec2 terminate-instances --instance-ids "$INSTANCE_ID" --region "$REGION"

echo "Waiting for EC2 instance to terminate..."
aws ec2 wait instance-terminated --instance-ids "$INSTANCE_ID" --region "$REGION"
echo "EC2 instance $INSTANCE_ID terminated."

# ----------- Delete S3 Bucket ----------------
echo "Deleting all objects from S3 bucket $S3_BUCKET..."
aws s3 rm "s3://$S3_BUCKET" --recursive

echo "Deleting S3 bucket $S3_BUCKET..."
aws s3api delete-bucket --bucket "$S3_BUCKET" --region "$REGION"
echo "S3 bucket $S3_BUCKET deleted."

# ----------- Done ---------------------------
echo "Teardown complete!"

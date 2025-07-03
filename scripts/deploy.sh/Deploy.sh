#!/bin/bash

# ============================================
# AWS EC2 & S3 Deploy Script - Bash
# ============================================
# Make sure AWS CLI is installed and configured (aws configure)

# ----------- Configurable Variables ----------
REGION="us-east-1"
INSTANCE_TYPE="t2.micro"
KEY_NAME="my-key-pair"  # Replace with your actual key pair name
S3_BUCKET="my-unique-s3-bucket-$(date +%s)"  # Generates unique bucket name with timestamp

# ----------- Deploy EC2 Instance -------------
echo "Launching EC2 instance..."
INSTANCE_ID=$(aws ec2 run-instances \
    --image-id ami-0c02fb55956c7d316 \  # Amazon Linux 2 AMI for us-east-1 (update if needed)
    --count 1 \
    --instance-type $INSTANCE_TYPE \
    --key-name $KEY_NAME \
    --region $REGION \
    --query 'Instances[0].InstanceId' \
    --output text)

echo "EC2 instance launched with ID: $INSTANCE_ID"

# ----------- Create S3 Bucket ----------------
echo "Creating S3 bucket: $S3_BUCKET"
aws s3api create-bucket \
    --bucket "$S3_BUCKET" \
    --region "$REGION" \
    --create-bucket-configuration LocationConstraint=$REGION

echo "S3 bucket $S3_BUCKET created."

# ----------- Done ---------------------------
echo "Deployment complete!"
echo "EC2 Instance ID: $INSTANCE_ID"
echo "S3 Bucket: $S3_BUCKET"

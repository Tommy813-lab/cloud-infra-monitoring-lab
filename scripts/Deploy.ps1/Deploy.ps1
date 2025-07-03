# ========================================
# AWS EC2 & S3 Deploy Script - PowerShell
# ========================================
# Make sure AWS CLI is configured with your credentials before running.
# Assumes you have AWS CLI installed and configured (aws configure)

# Configurable variables
$Region = "us-east-1"
$InstanceType = "t2.micro"
$KeyName = "my-key-pair"   # Replace with your actual key pair name
$S3BucketName = "my-unique-s3-bucket-name-$(Get-Random)"  # Generates unique bucket name

# ---------------------------
Write-Output "Deploying EC2 instance..."
# Launch EC2 instance
$InstanceId = aws ec2 run-instances `
    --image-id ami-0c02fb55956c7d316 `  # Example Amazon Linux 2 AMI (update if needed)
    --count 1 `
    --instance-type $InstanceType `
    --key-name $KeyName `
    --region $Region `
    --query 'Instances[0].InstanceId' `
    --output text

Write-Output "EC2 Instance launched with ID: $InstanceId"

# ---------------------------
Write-Output "Creating S3 bucket..."
# Create S3 bucket
aws s3api create-bucket `
    --bucket $S3BucketName `
    --region $Region `
    --create-bucket-configuration LocationConstraint=$Region

Write-Output "S3 Bucket created: $S3BucketName"

# ---------------------------
Write-Output "Deployment complete!"
Write-Output "EC2 Instance ID: $InstanceId"
Write-Output "S3 Bucket: $S3BucketName"

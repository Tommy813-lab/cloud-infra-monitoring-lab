# ========================================
# AWS EC2 & S3 Destroy Script - PowerShell
# ========================================
# Make sure AWS CLI is configured with your credentials before running.
# Assumes you have AWS CLI installed and configured (aws configure)

# Configurable variables
$Region = "us-east-1"
$InstanceId = Read-Host "Enter the EC2 Instance ID to terminate"
$S3BucketName = Read-Host "Enter the S3 Bucket name to delete"

# ---------------------------
Write-Output "Terminating EC2 instance $InstanceId..."
aws ec2 terminate-instances `
    --instance-ids $InstanceId `
    --region $Region

Write-Output "Waiting for instance to terminate..."
aws ec2 wait instance-terminated `
    --instance-ids $InstanceId `
    --region $Region

Write-Output "EC2 Instance $InstanceId terminated."

# ---------------------------
Write-Output "Deleting all objects from S3 bucket $S3BucketName..."
# Empty the bucket first
aws s3 rm s3://$S3BucketName --recursive

Write-Output "Deleting S3 bucket $S3BucketName..."
aws s3api delete-bucket `
    --bucket $S3BucketName `
    --region $Region

Write-Output "S3 Bucket $S3BucketName deleted."

# ---------------------------
Write-Output "Teardown complete!"

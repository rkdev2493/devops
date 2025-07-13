# Terragrunt EC2 Metrics Collection

This project uses Terragrunt to manage Terraform modules for provisioning EC2 instances, associating SSM documents, and collecting CloudWatch metrics.

## Structure
- `modules/ec2`: EC2 instance resources
- `modules/ssm`: SSM association for CloudWatch agent
- `modules/cloudwatch`: CloudWatch metric alarms
- `live/dev` and `live/prod`: Environment configurations

## Usage
1. Configure your AWS credentials.
2. Run Terragrunt in the desired environment folder:
   ```
   terragrunt apply
   ```..
b
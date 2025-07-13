output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.ec2_instance.id
}

output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.ec2_instance.public_ip
}

output "private_ip" {
  description = "Private IP of the EC2 instance"
  value       = aws_instance.ec2_instance.private_ip
}

output "instance_state" {
  description = "State of the EC2 instance"
  value       = aws_instance.ec2_instance.instance_state
}

output "subnet_id" {
  description = "The subnet ID where the instance was created"
  value       = aws_instance.ec2_instance.subnet_id
}

output "security_group_id" {
  description = "The security group ID attached to the instance"
  value       = aws_security_group.ec2_sg.id
}

output "iam_role_name" {
  description = "The name of the IAM role attached to the instance"
  value       = aws_iam_role.ec2_cloudwatch_ssm.name
}

output "cloudwatch_config_parameter" {
  description = "The SSM parameter name storing the CloudWatch agent configuration"
  value       = aws_ssm_parameter.cloudwatch_agent_config.name
}

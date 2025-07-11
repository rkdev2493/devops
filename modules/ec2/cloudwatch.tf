variable "instance_id" {
  description = "ID of the EC2 instance to associate CloudWatch Agent"
}

resource "aws_ssm_parameter" "cloudwatch_agent_config" {
  name        = "/AmazonCloudWatch/cloudwatch-agent-config"
  type        = "String"
  value       = file("${path.module}/cloudwatch-agent-config.json")
}


resource "aws_ssm_parameter" "cloudwatch_agent_config" {
  name        = "/AmazonCloudWatch/cloudwatch-agent-config-${terraform.workspace}"
  type        = "String"
  value       = local.cloudwatch_agent_config
  overwrite   = true
}

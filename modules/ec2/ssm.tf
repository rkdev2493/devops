resource "aws_ssm_association" "cloudwatch_agent" {
  name = "AmazonCloudWatch-ManageAgent"
  targets {
    key    = "InstanceIds"
    values = [var.instance_id]
  }
  parameters = {
    action = ["Install"]
    mode   = ["ec2"]
    optionalConfigurationSource = ["ssm"]
    optionalConfigurationLocation = [aws_ssm_parameter.cloudwatch_agent_config.name]
    optionalRestart = ["yes"]
  }
}

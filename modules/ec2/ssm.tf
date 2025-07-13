resource "aws_ssm_association" "cloudwatch_agent" {
  name = "AmazonCloudWatch-ManageAgent"
  targets {
    key    = "InstanceIds"
    values = [aws_instance.ec2.id]
  }
  parameters = {
    action = ["Install"]
    mode   = ["ec2"]
    optionalConfigurationSource = ["ssm"]
    optionalConfigurationLocation = [aws_ssm_parameter.cloudwatch_agent_config.name]
    optionalRestart = ["yes"]
  }
}

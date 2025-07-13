resource "aws_instance" "ec2_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_ids[0]  # Using first subnet from the list

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y amazon-cloudwatch-agent
              /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -s -c ssm:/AmazonCloudWatch/cloudwatch-agent-config
              systemctl start amazon-cloudwatch-agent
              systemctl enable amazon-cloudwatch-agent
              EOF

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "CloudWatch-Monitored-Instance"
  }
}
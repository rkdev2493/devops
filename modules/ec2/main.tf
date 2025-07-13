terraform {
  backend "s3" {}
}
resource "aws_iam_role" "ec2_cloudwatch_ssm" {
  name = "ec2-cloudwatch-ssm-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ssm" {
  role       = aws_iam_role.ec2_cloudwatch_ssm.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "cloudwatch" {
  role       = aws_iam_role.ec2_cloudwatch_ssm.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-cloudwatch-ssm-profile"
  role = aws_iam_role.ec2_cloudwatch_ssm.name
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  description = "EC2 instance type"
}

variable "vpc_id" {
  description = "VPC ID for the EC2 instance"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EC2 instance"
  type        = list(string)
}

resource "aws_security_group" "ec2_sg" {
  name        = "ec2-cloudwatch-sg"
  description = "Allow SSH and CloudWatch Agent traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

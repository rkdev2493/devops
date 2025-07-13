terraform {
  source = "../../modules/ec2"
}

inputs = {
  ami           = "ami-05ffe3c48a9991133"
  instance_type = "t3.micro"
  vpc_id        = "vpc-097c68ffb36fee260"
  subnet_ids    = [
    "subnet-0ab8593deca82890e",
    "subnet-0d7dfa2944edc6e91",
    "subnet-0344d9a115f0e22b5",
    "subnet-0838af7737ed3d7bd",
    "subnet-02d83c9a0cc699f68",
    "subnet-0fd895d3462f037b4"
  ]
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "bucket101439840"  # Matches your S3 bucket name
    key            = "dev/ec2/terraform.tfstate"   # Customize path per module/environment
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "my-lock-table"               # Matches your DynamoDB table name
  }
}

include {
  path = find_in_parent_folders()
}

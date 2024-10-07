resource "aws_instance" "jump_box" {
    ami = var.ami_id
    subnet_id = var.private_subnet_1_id
    associate_public_ip_address = false
    instance_type = var.instance_type
    vpc_security_group_ids = var.aws_security_group
    iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
    root_block_device {
       volume_size = 20
    }   
    tags = {
      Name = "jump_box"
      Terraform = true
      Environment = "staging"
    }

}


# Define IAM instance profile
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "EC2Profile"
  role = aws_iam_role.jb_ec2_role.name


}

# Define IAM role for EC2
resource "aws_iam_role" "jb_ec2_role" {
  name = "EC2Role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      },
      Action    = "sts:AssumeRole"
    }]
  })
}

# Define IAM policy
resource "aws_iam_policy" "ssm_policy" {
  name        = "FullAccessPolicy"
  description = "Policy granting full access to S3 and Secrets Manager"
  
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "ssm:UpdateInstanceInformation",
          "ssmmessages:CreateControlChannel",
          "ssmmessages:CreateDataChannel",
          "ssmmessages:OpenControlChannel",
          "ssmmessages:OpenDataChannel"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ssm_attachment" {
  role       = aws_iam_role.jb_ec2_role.name
  policy_arn = aws_iam_policy.ssm_policy.arn
}
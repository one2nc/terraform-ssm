
resource "aws_security_group" "jb_sg" {
  name        = "jb_sg"
  description = "Security group for jump box"

  vpc_id = var.vpc_id 

  tags = {
    role = "private"
    project = "blog"
    environment = "staging"
    Terraform = "true"
  }

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = []
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
}

  resource "aws_security_group" "vpc_endpoint" {
    name = "ssm_sg"
    description = "Security group fro vpc-endpoint"
    
    vpc_id = var.vpc_id

    tags = {
    role = "private"
    project = "blog"
    environment = "staging"
    Terraform = "true"
  }

    ingress {
      from_port = 443
      to_port = 443
      protocol = "tcp"
      security_groups = [ aws_security_group.jb_sg.id ]

    }

    egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    description     = "Allow all outbound traffic"
  }

    
  }
resource "aws_vpc_endpoint" "ssm" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.us-west-2.ssm"
  vpc_endpoint_type = "Interface"
  
  subnet_ids = var.private_subnet_ids

  security_group_ids = var.security_group_ids

  private_dns_enabled = true

  tags = {
    Name = "ssm-endpoint"
    Environment = "staging"
  }
}

resource "aws_vpc_endpoint" "ssmmessages" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.us-west-2.ssmmessages"
  vpc_endpoint_type = "Interface"
  
  subnet_ids = var.private_subnet_ids

  security_group_ids = var.security_group_ids

  private_dns_enabled = true

  tags = {
    Name = "ssmmessages-endpoint"
    Environment = "staging"
  }
}
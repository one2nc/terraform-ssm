output "jb_sg" {
    value = aws_security_group.jb_sg.id
  
}

output "vpc_endpoint_sg" {
    value = aws_security_group.vpc_endpoint.id
  
}
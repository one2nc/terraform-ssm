variable "ami_id" {
    description = "ami of jump box"
  
}

variable "instance_type" {
    description = "size of the instance"
  
}


variable "private_subnet_1_id" {
  description = "string"
  
}


variable "aws_security_group" {
  description = "security group jump box"
  type = list(string)
  
}


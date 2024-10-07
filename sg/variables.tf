variable "vpc_id" {
  description = "VPC_ID"
  type        = string
}

variable "private_subnets" {
  type = list(string)
  
}
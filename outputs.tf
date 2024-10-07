output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "jb_instance_id" {
  description = "Id of the ec2 instance"
  value = module.ec2_jumpbox.jb_instance_id
  
}
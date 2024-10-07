/*---------------------------------------------------------------------VPC----------------------------------------------------*/

module "vpc" {
  source               = "./modules/vpc"
  vpc_name             = local.vpc_name
  vpc_cidr             = local.vpc_cidr
  availability_zones   = local.availability_zones
  public_subnets_cidr  = local.public_subnets_cidr
  private_subnets_cidr = local.private_subnets_cidr

}



/*---------------------------------------------------------------------SG----------------------------------------------------*/

module "sg" {
  source          = "./modules/sg"
  vpc_id          = module.vpc.vpc_id
  private_subnets = local.private_subnets_cidr

}


/*---------------------------------------------------------------------EC2----------------------------------------------------*/

module "ec2_jumpbox" {
  source = "./modules/ec2/jump_box"
  instance_type = local.jb_instance_type
  private_subnet_1_id = module.vpc.private_subnets[0]
  ami_id = local.jb_ami_id
  aws_security_group = [module.sg.jb_sg]

}

/*---------------------------------------------------------------------SSM----------------------------------------------------*/

module "vpc_endpoint" {
  source = "./modules/vpc_endpoint"
  private_subnet_ids = [module.vpc.private_subnets[0], module.vpc.private_subnets[1]]
  vpc_id = module.vpc.vpc_id
  security_group_ids = [module.sg.vpc_endpoint_sg]
  
}


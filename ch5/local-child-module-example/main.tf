###  CREATING VPC, SUBNET, ROUTE TABLE, IGW ###
module "vpc" {
  source            = "./modules/networking"
  vpc_cidr_block    = "10.51.0.0/16"
  vpc_name          = "child-module-vpc"
  subnet_name       = "child-module-subnet"
  subnet_cidr_block = "10.51.1.0/24"
  az                = "ap-south-1a"
  igw_name          = "child-module-igw"
}

###  CREATING SECURITY GROUP AND RULES ###
module "security_group" {
  source              = "./modules/security-group"
  vpc_id              = module.vpc.vpc_id
  security_group_name = "child-module-sg"
  allowed_ip          = "1.2.3.4/32" # This is just an example IP
  from_port           = "22"
  to_port             = "22"
}

### USING DATASOURCE TO GET THE LATEST AMI ###
data "aws_ami" "root_module_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

### LAUNCHING AN EC2 INSTANCE ###
module "ec2_instance" {
  source                 = "./modules/ec2"
  instance_ami           = data.aws_ami.root_module_ami.id
  instance_type          = "t3.micro"
  root_volume_size       = 11
  subnet_id              = module.vpc.subnet_id
  vpc_security_group_ids = [module.security_group.sg_id]
}

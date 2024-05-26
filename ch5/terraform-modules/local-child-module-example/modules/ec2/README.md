This module creates an ec2 instance. 

The focus here is to show the working of the local module and the steps followed to launch 
the ec2 instance is only for testing and does not follow all best practices required for production. 
For example, there is no keypair associated to instance to avoid security concerns with this module.

Usage:
module "ec2_instance" {
  source                 = "./modules/ec2"
  instance_ami           = "ami-008b777609c202186"
  instance_name          = "test-instance"
  instance_type          = "t3.micro"
  root_volume_size       = 11
  subnet_id              = "subnet-0dda5cf3303example"
  vpc_security_group_ids = [sg-02bd1b941111111]
}

This folder contains following files:
main.tf      - Contains the Terraform resource block which has the code to launch an EC2 instance. 
outputs.tf   - Contains the code to display the ec2 id after the instance gets launched. 
variables.tf - Has all the variables which are used to customize the EC2 instance attributes. 

Inputs:
instance_type          - This variable is used to decide the instance type of EC2
instance_name          - This variable is used to name the ec2 instance
instance_ami           - AMI ID used for the instance launch
root_volume_size       - Size of the root volume
vpc_security_group_ids - Security groups to be associated with ec2 instance
subnet_id              - Subnet where the instance has to be launched

Outputs:
ec2_id - Instance ID of the EC2 instance
This module creates a security group and the security group rules. 
The module is not intended for the production setup as it does not have the best practices(For example, allows all IPs for egress security group rule) as recommended by AWS. The focus here is to enable the learning of the local module. 

Usage:
module "security_group" {
  source              = "./modules/security-group"
  vpc_id              = "vpc-0edb4755e2example"
  security_group_name = "child-module-sg"
  allowed_ip          = "1.1.1.1/32" # This is just an example IP
  from_port           = "22"
  to_port             = "22"
}

This folder contains following files:
main.tf      - Contains the Terraform resource block which has the code to create security group and security group rules.
outputs.tf   - Contains the code to display the required outputs after the resource creation. 
variables.tf - Has all the variables which are used to customize the security group and rule's attributes. 

Inputs:
security_group_name - Name for the security group
vpc_id              - VPC ID
allowed_ip          - IP to be allowed in the security group
from_port           - Port to be allowed in the SG rule
to_port             - Indicates the last port till which the traffic has to be allowed starting from the 'from_port'

Outputs:
sg_id    - Security Group ID
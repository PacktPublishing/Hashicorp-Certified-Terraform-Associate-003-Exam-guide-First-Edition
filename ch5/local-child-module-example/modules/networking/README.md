This module creates a VPC, single subnet, IGW, route table, route table entries. 
The module is not intended for the production setup as it does not have the best practices(For example, uses only single subnet) to be followed for the creation of AWS VPC. The focus here is to enable the learning of the local module. 

Usage:
module "vpc" {
  source            = "./modules/networking"
  vpc_cidr_block    = "10.51.0.0/16"
  vpc_name          = "child-module-vpc"
  subnet_name       = "child-module-subnet"
  subnet_cidr_block = "10.51.1.0/24"
  az                = "ap-south-1a"
  igw_name          = "child-module-igw"
  route_table_name  = "child-module-rt"
}

This folder contains following files:
main.tf      - Contains the Terraform resource block which has the code to create VPC, Subnet, IGW and route table.   
outputs.tf   - Contains the code to display the required outputs after the resource creation. 
variables.tf - Has all the variables which are used to customize the VPC's attributes. 

Inputs:
vpc_cidr_block    - This variable is used to pass CIDR block to VPC
vpc_name          - This variable is used to pass the name to VPC
subnet_name       - This variable is used to pass the name to subnet
subnet_cidr_block - This variable is used to pass CIDR block to Subnet
az                - AZ used for the creation of subnet
igw_name          - This variable is used to pass the name to Internet Gateway
route_table_name  - Name of the routing table

Outputs:
vpc_id    - VPC ID of the VPC
subnet_id - Subnet ID
igw_id    - Internet Gateway ID
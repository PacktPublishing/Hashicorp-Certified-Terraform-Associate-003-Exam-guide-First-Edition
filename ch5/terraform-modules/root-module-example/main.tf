### PROVIDER VERSION AND CONFIGURATION ###
/* You start by defining the provider which is used by Terraform to make the api call to the respective platform to provision the resources. 
Here the code defines AWS as the provider and locks the version to 5.34.0. */
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.34.0"
    }
  }
}

/* Configure the settings of the provider. In this case, you are defining the provider region to be ap-south-1 ie mumbai */
provider "aws" {
  region = "ap-south-1"
}

### CREATING THE VPC ###
/* You use the resource block to create the VPC. Any customizations to the vpc can be done by using the arguments supported by the "aws_vpc" resource */
resource "aws_vpc" "root_module_vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "root-module-vpc"
  }
}

### CREATING THE SUBNETS ###
/* Here we are creating one subnet in each of the Availability zones. The data block is used to give us the information about the availability zones in the mumbai region. This is used as an input for the meta-argument "count" which creates the resources as many times as it is defined. Since count needs a number, we use a terraform function called "length" which gives a number depending on the number of objects. Since Mumbai has 3 AZs, we should see 3 subnets getting created. 
CIDR block has to be passed as an input */

data "aws_availability_zones" "mumbai_azs" {
  state = "available"
}

resource "aws_subnet" "root_module_subnets" {
  vpc_id            = aws_vpc.root_module_vpc.id
  count             = length(data.aws_availability_zones.mumbai_azs.zone_ids)
  cidr_block        = var.subnet_cidr_block[count.index]
  availability_zone = data.aws_availability_zones.mumbai_azs.names[count.index]
  tags = {
    Name = "root-module-subnets-${count.index}"
  }
}

### CREATING THE INTERNET GATEWAY ###
/* Internet gateway is being created in the below block */
resource "aws_internet_gateway" "root_module_igw" {
  vpc_id = aws_vpc.root_module_vpc.id
  tags = {
    "Name" = "root-module-igw"
  }
}

### CREATING THE ROUTE TABLE ###
/* When a new vpc is provisioned, a default route table gets created and all the subnets are implicitly associated to this default table. This is not recommended in production. Hence we have created a custom route table. This will be a blank route table when it is created */
resource "aws_route_table" "root_module_rt" {
  vpc_id = aws_vpc.root_module_vpc.id

  tags = {
    Name = "root-module-rt"
  }
}

### CREATING THE ROUTES ###
/* The blank route table created in the preceding block needs to be filled with the routes which will decide how the traffic gets routed within the VPC. Here we are using a single route which routes all the traffic destined to internet(0.0.0.0/0) to go to internet gateway */
resource "aws_route" "root_module_rt_routes" {
  route_table_id         = aws_route_table.root_module_rt.id
  destination_cidr_block = "1.2.3.4/32"
  gateway_id             = aws_internet_gateway.root_module_igw.id
}

### ASSOCIATING THE SUBNETS TO THE ROUTE TABLE ###
/* Since we have created custom route table, we will associate the newly created subnets to this custom route table by explicit association */
resource "aws_route_table_association" "root_module_subnet_association" {
  count          = length(var.subnet_cidr_block)
  subnet_id      = element(aws_subnet.root_module_subnets.*.id, count.index)
  route_table_id = aws_route_table.root_module_rt.id
}
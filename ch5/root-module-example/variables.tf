# Defining the Cidr block for the VPC. Notice there is no default option used here which makes it mandatory. You will have to pass the value for this variable to proceed.
variable "vpc_cidr_block" {
  description = "This is the CIDR block of VPC"
  type        = string
}

# Defining the Cidr blocks for the Subnets. Just like the vpc_cidr_block variable, this too does not have default value making this also mandatory. However the type of this is list(string) which says you have to pass the values as list(which can be any number of values). 
variable "subnet_cidr_block" {
  description = "With this variable you supply the cidr block for the subnets"
  type        = list(string)
}
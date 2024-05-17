### VARIABLES FOR NETWORKING MODULE ###
variable "vpc_cidr_block" {
  type        = string
  description = "This variable is used to pass CIDR block to VPC"
}

variable "vpc_name" {
  type        = string
  description = "This variable is used to pass the name to VPC"
  default     = "child-module-vpc"
}

variable "subnet_name" {
  type        = string
  description = "This variable is used to pass the name to subnet"
  default     = "child-module-subnet"
}

variable "subnet_cidr_block" {
  type        = string
  description = "This variable is used to pass CIDR block to Subnet"
}

variable "az" {
  description = "AZ used for the creation of subnet"
  type        = string
  default     = "ap-south-1a"
}

variable "igw_name" {
  type        = string
  description = "This variable is used to pass the name to Internet Gateway"
  default     = "child-module-igw"
}

variable "route_table_name" {
  type        = string
  description = "Name of the routing table"
  default     = "child-module-rt"
}

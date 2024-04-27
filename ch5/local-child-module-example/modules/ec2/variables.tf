### VARIABLES FOR EC2 MODULE ###
variable "instance_type" {
  type        = string
  description = "This variable is used to decide the instance type of EC2"
  default     = "t3.small"
}

variable "instance_name" {
  type        = string
  description = "This variable is used to name the ec2 instance"
  default     = "child-module-ec2"
}

variable "instance_ami" {
  type        = string
  description = "AMI ID used for the instance launch"
}

variable "root_volume_size" {
  type        = number
  description = "Size of the root volume"
  default     = 10
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "Security groups to be associated with ec2 instance"
}

variable "subnet_id" {
  type        = string
  description = "Subnet where the instance has to be launched"
}

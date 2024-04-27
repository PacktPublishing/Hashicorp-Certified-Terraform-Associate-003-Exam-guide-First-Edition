### VARIABLES USED IN THE SECURITY GROUP MODULE  ###
variable "security_group_name" {
  type        = string
  description = "Name for the security group"
  default     = "child-module-sg"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "allowed_ip" {
  type        = string
  description = "IP to be allowed in the security group"
  default     = "0.0.0.0/0"
}

variable "from_port" {
  type        = string
  description = "Port to be allowed in the SG rule"
  default     = ""
}

variable "to_port" {
  type        = string
  description = "Indicates the last port till which the traffic has to be allowed starting from the 'from_port' " 
  default     = ""
}
variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}

variable "cidr_block" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = []
}
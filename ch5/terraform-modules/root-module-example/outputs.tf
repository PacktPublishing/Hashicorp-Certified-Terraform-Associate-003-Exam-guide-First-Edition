#Outputs VPC ID
output "vpc_id" {
  description = "VPD ID"
  value       = aws_vpc.root_module_vpc.id
}

#Outputs all 3 subnet IDs
output "subnets_id" {
  description = "ID of all provisioned subnets"
  value       = aws_subnet.root_module_subnets[*].id
}

#Outputs Internet Gateway ID
output "igw" {
  description = "Internet Gateway id"
  value       = aws_internet_gateway.root_module_igw.id
}

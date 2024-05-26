### OUTPUTS OF NETWORKING MODULE ###
output "vpc_id" {
  description = "VPC ID of the VPC"
  value       = aws_vpc.child_module_vpc.id
}

output "subnet_id" {
  description = "Subnet ID"
  value       = aws_subnet.child_module_subnet.id
}

output "igw_id" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.child_module_igw.id
}
### OUTPUTS RELATED TO VPC ###
output "vpc_id" {
  description = "VPC ID of the VPC provisioned by the module"
  value       = module.vpc.vpc_id
}

output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = module.vpc.igw_id
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

### OUTPUTS RELATED TO SECURITY GROUP ###
output "security_group_id" {
  description = "Security group ID of the SG provisioned by the module"
  value       = module.security_group.security_group_id
}

### OUTPUTS RELATED TO EC2 INSTANCE ###
output "ec2_id" {
  description = "Instance ID of the EC2 provisioned by the module"
  value       = module.security_group.security_group_id
}
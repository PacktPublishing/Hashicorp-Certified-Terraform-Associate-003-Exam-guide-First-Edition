output "vpc_id" {
  description = "VPD ID"
  value       = module.vpc.vpc_id
}

output "sg_id" {
  description = "Security Group ID"
  value       = module.security_group.sg_id
}

output "ec2_id" {
  description = "Instance ID of the EC2"
  value       = module.ec2_instance.ec2_id
}

output "igw_id" {
  description = "Instance ID of the EC2"
  value       = module.vpc.igw_id
}

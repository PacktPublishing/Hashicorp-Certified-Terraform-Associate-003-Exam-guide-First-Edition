### OUTPUTS OF EC2 MODULE ###
output "ec2_id" {
  description = "Instance ID of the EC2 instance"
  value       = aws_instance.child_module_ec2.id
}
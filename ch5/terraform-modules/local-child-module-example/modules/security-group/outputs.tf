### OUTPUTS OF SECURITY GROUP MODULE ###
output "sg_id" {
  description = "Security Group ID"
  value       = aws_security_group.child_module_sg.id
}
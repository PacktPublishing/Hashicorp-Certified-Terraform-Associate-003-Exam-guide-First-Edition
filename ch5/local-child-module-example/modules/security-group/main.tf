### CREATING THE SECURITY GROUP FOR THE EC2 INSTANCE  ###
resource "aws_security_group" "child_module_sg" {
  name        = var.security_group_name
  description = "This SG is used with the EC2 instance"
  vpc_id      = var.vpc_id
  tags = {
    Name = var.security_group_name
  }
}

### CREATING THE SECURITY GROUP RULES FOR THE ABOVE SG  ###
resource "aws_vpc_security_group_ingress_rule" "child_module_allow_ingress" {
  security_group_id = aws_security_group.child_module_sg.id
  cidr_ipv4         = var.allowed_ip
  from_port         = var.from_port
  ip_protocol       = "tcp"
  to_port           = var.to_port
}

resource "aws_vpc_security_group_egress_rule" "child_module_allow_egress" {
  security_group_id = aws_security_group.child_module_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

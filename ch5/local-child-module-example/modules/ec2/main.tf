### CODE FOR AN EC2 INSTANCE ###
resource "aws_instance" "child_module_ec2" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id
  root_block_device {
    volume_size = var.root_volume_size
    volume_type = "gp3"
  }

  tags = {
    Name = var.instance_name
  }
}
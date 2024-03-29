provider "aws" {
  region = "us-east-1"
}

# Uncomment the below resource block to create default VPC with the below command.
# terraform apply -target=”aws_default_vpc.default”
#
# resource "aws_default_vpc" "default" {
#  tags = {
#    Name = "default-vpc"
#  }
#}


resource "aws_instance" "testinstance" {
  ami           = "ami-0cb06ac50a7eea4f2"
  instance_type = "t3.micro"
}

resource "aws_eip" "ip" {
  instance = aws_instance.testinstance.id
}

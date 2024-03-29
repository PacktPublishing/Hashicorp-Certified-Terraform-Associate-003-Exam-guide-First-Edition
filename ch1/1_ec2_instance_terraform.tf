terraform {
 required_providers {
   aws = {
     source  = "hashicorp/aws"
     version = "~> 5.0"
   }
 }
}
 
provider "aws" {
 region = "us-east-1"
}
 
variable "ami" {
 default = "ami-00e93213821bcacf8"
 description = "Amazon Machine Image ID for Bottlerocket"
}
 
resource "aws_instance" "demo" {
 ami = var.ami
 instance_type = "t3.large"
 tags = {
   name = "Demo System"
 }
}
 
output "instance_id" {
 instance = aws_instance.demo.id
}
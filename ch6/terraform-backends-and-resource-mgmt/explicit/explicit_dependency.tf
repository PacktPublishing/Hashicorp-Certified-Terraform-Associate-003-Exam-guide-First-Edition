provider "aws" {
  region = "us-east-1"
}
#creates a S3 bucket with random name
resource "aws_s3_bucket" "appbucket" {}

resource "aws_instance" "testinstance" {
  ami           = "ami-0cb06ac50a7eea4f2"
  instance_type = "t3.micro"
  depends_on    = [aws_s3_bucket.appbucket]
}

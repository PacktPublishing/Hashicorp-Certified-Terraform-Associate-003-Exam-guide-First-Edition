resource "aws_s3_bucket" "test-bucket" {
  bucket = "test-s3-bucket-kquiyrt"

  tags = {
    Name      = "S3Bucket"
    CreatedBy = "TestUser"
  }
}

resource "aws_s3_bucket_versioning" "versioning_demo" {
  bucket = aws_s3_bucket.test-bucket.bucket
  versioning_configuration {
    status = "Enabled"
  }
}


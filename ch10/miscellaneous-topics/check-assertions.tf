resource "aws_s3_bucket" "app_bucket" {
  #  force_destroy = true
}

check "destroy_check" {
  assert {
    condition     = aws_s3_bucket.app_bucket.force_destroy == true
    error_message = "The S3 bucket created with the force_destroy parameter as false"
  }
}
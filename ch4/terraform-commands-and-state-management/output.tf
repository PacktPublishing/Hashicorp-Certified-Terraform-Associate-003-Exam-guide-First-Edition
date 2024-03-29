output "access_key" {
  value = aws_iam_access_key.user_access_keys.id
}

output "user_arn" {
  value = aws_iam_user.test_user.arn
}
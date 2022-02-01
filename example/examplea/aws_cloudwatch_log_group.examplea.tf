resource "aws_cloudwatch_log_group" "example" {
  name              = var.log_group_name
  kms_key_id        = aws_kms_key.example.arn
  retention_in_days = 14
}

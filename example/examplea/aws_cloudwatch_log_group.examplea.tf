# holden:ignore:HLD_TF_020: "example" is the accurate name — this is the module's
# example fixture, not a placeholder left in production code
# holden:ignore:HLD_AWS_318: ephemeral fixture that CI destroys; deletion protection
# would block teardown
resource "aws_cloudwatch_log_group" "example" {
  name              = var.log_group_name[0]
  kms_key_id        = aws_kms_key.example.arn
  retention_in_days = 365
}

resource "aws_cloudwatch_log_subscription_filter" "filters" {
  for_each        = toset(var.log_group_name)
  name            = each.key
  role_arn        = aws_iam_role.cwl.arn
  log_group_name  = each.key
  filter_pattern  = var.filter_pattern
  destination_arn = aws_kinesis_firehose_delivery_stream.extended_s3_stream.arn
}

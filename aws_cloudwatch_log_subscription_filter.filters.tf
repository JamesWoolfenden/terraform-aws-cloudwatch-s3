resource "aws_cloudwatch_log_subscription_filter" "filters" {
  count           = length(var.log_group_name)
  name            = var.log_group_name[count.index]
  role_arn        = aws_iam_role.cwl.arn
  log_group_name  = var.log_group_name[count.index]
  filter_pattern  = var.filter_pattern
  destination_arn = aws_kinesis_firehose_delivery_stream.extended_s3_stream.arn
}

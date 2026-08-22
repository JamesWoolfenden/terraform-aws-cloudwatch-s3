# Delivery errors from the Firehose stream land here. Without this, a stream
# that cannot write to S3 fails silently and the outage presents only as logs
# not arriving.
# holden:ignore:HLD_AWS_318: deletion protection would make this module impossible to
# destroy; the log group lives and dies with the pipeline it belongs to
resource "aws_cloudwatch_log_group" "firehose_errors" {
  name              = "/aws/kinesisfirehose/${var.cloudwatch_stream_name}"
  retention_in_days = var.firehose_error_log_retention_days
  kms_key_id        = var.kms_master_key_id
}

resource "aws_cloudwatch_log_stream" "firehose_errors" {
  name           = "S3Delivery"
  log_group_name = aws_cloudwatch_log_group.firehose_errors.name
}

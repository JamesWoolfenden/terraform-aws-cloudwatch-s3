resource "aws_kinesis_firehose_delivery_stream" "extended_s3_stream" {
  name        = var.cloudwatch_stream_name
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn   = aws_iam_role.firehosetos3.arn
    bucket_arn = aws_s3_bucket.cloudwatch_bin.arn
  }

  server_side_encryption {
    enabled  = var.server_side_encryption
    key_arn  = var.kms_master_key_id
    key_type = "CUSTOMER_MANAGED_CMK"
  }
}

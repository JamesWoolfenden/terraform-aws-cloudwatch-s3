resource "aws_kinesis_firehose_delivery_stream" "extended_s3_stream" {
  name        = var.cloudwatch_name
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn   = aws_iam_role.firehosetos3.arn
    bucket_arn = aws_s3_bucket.log_bucket.arn
  }
}

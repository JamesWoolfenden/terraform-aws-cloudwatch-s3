resource "aws_kinesis_firehose_delivery_stream" "extended_s3_stream" {
  provider    = "aws.dublin"
  name        = "${var.cloudwatch_name}-EXTENDED-S3-TEST-STREAM"
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn   = "${aws_iam_role.firehosetos3.arn}"
    bucket_arn = "${aws_s3_bucket.log_bucket.arn}"
  }
}

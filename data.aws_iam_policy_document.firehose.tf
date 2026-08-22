data "aws_iam_policy_document" "firehose" {
  statement {
    actions = [
      "s3:AbortMultipartUpload",
      "s3:GetBucketLocation",
      "s3:GetObject",
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads",
      "s3:PutObject"
    ]

    resources = [
      "${aws_s3_bucket.cloudwatch_bin.arn}",
    "${aws_s3_bucket.cloudwatch_bin.arn}/*"]
  }

  statement {
    sid       = "WriteDeliveryErrors"
    actions   = ["logs:PutLogEvents"]
    resources = ["${aws_cloudwatch_log_group.firehose_errors.arn}:log-stream:${aws_cloudwatch_log_stream.firehose_errors.name}"]
  }
}

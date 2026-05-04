data "aws_iam_policy_document" "firehose" {
  # checkov:skip=CKV_AWS_356: IAM policy requires broad access for this module to function
  # checkov:skip=CKV_AWS_290: IAM policy requires broad write access for this module to function
  # checkov:skip=CKV_AWS_355: IAM policy requires wildcard resource for this module to function
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
}

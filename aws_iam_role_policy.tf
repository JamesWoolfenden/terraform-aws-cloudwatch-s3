resource "aws_iam_role_policy" "permissionsforfirehose" {
  name = "${var.cloudwatch_name}-POLICY"
  role = aws_iam_role.firehosetos3.id

  policy = <<EOF
{
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
            "s3:AbortMultipartUpload",
            "s3:GetBucketLocation",
            "s3:GetObject",
            "s3:ListBucket",
            "s3:ListBucketMultipartUploads",
            "s3:PutObject" ],
        "Resource": [
            "${aws_s3_bucket.log_bucket.arn}",
            "${aws_s3_bucket.log_bucket.arn}/*" ]
      }
    ]
}
EOF
}

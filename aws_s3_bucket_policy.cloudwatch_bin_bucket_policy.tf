resource "aws_s3_bucket_policy" "cloudwatch_bin_bucket_policy" {
  bucket = aws_s3_bucket.cloudwatch_bin.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowCloudWatchLogsGetBucketAcl"
        Effect    = "Allow"
        Action    = "s3:GetBucketAcl"
        Resource  = aws_s3_bucket.cloudwatch_bin.arn
        Principal = { Service = "logs.${data.aws_region.current.name}.amazonaws.com" }
      },
      {
        Sid       = "AllowCloudWatchLogsPutObject"
        Effect    = "Allow"
        Action    = "s3:PutObject"
        Resource  = "${aws_s3_bucket.cloudwatch_bin.arn}/*"
        Principal = { Service = "logs.${data.aws_region.current.name}.amazonaws.com" }
        Condition = {
          StringEquals = {
            "s3:x-amz-acl" = "bucket-owner-full-control"
          }
        }
      },
      {
        Sid       = "DenyInsecureTransport"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          aws_s3_bucket.cloudwatch_bin.arn,
          "${aws_s3_bucket.cloudwatch_bin.arn}/*"
        ]
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      }
    ]
  })
}

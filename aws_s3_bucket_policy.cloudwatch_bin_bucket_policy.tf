resource "aws_s3_bucket_policy" "cloudwatch_bin_bucket_policy" {
  bucket = aws_s3_bucket.cloudwatch_bin.id

  policy = <<-EOT
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "s3:GetBucketAcl",
        "Effect": "Allow",
        "Resource": "arn:aws:s3:::${var.log_bucket}",
        "Principal": {
          "Service": "logs.${data.aws_region.current.name}.amazonaws.com"
        }
      },
      {
        "Action": "s3:PutObject" ,
        "Effect": "Allow",
        "Resource": "arn:aws:s3:::${var.log_bucket}/*",
        "Condition": {
          "StringEquals": {
            "s3:x-amz-acl": "bucket-owner-full-control"
          }
        },
        "Principal": {
          "Service": "logs.${data.aws_region.current.name}.amazonaws.com"
        }
      }
    ]
  }
  EOT
}

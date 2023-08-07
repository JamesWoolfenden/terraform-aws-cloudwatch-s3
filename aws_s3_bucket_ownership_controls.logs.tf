resource "aws_s3_bucket_ownership_controls" "logs" {
  bucket = aws_s3_bucket.cloudwatch_bin.id

  rule {
    object_ownership = "ObjectWriter"
  }

  depends_on = [
    aws_s3_bucket_policy.cloudwatch_bin_bucket_policy,
    aws_s3_bucket_public_access_block.bucket,
    aws_s3_bucket.cloudwatch_bin
  ]
}

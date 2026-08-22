# Server access logs for the delivery bucket. The module owns this target
# rather than asking the caller to supply one, because a log-delivery bucket
# has prerequisites that are easy to get wrong and fail silently: S3 drops
# records instead of erroring when they are not met.
# holden:ignore:HLD_AWS_144: this bucket IS the server-access-log target; giving it
# one would need a fourth bucket with the same requirement, and so on
# holden:ignore:HLD_AWS_310: Object Lock needs versioning, deliberately Disabled here,
# and can only be set at bucket creation
resource "aws_s3_bucket" "access_logs" {
  bucket = local.access_log_bucket
}

# Deliberately AES256, not the CMK used everywhere else in this module.
# S3 server access logging does not support SSE-KMS on the destination bucket,
# and when it is set S3 silently drops log records rather than failing.
# holden:ignore:HLD_AWS_282: server access logging does not support SSE-KMS on the destination bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "access_logs" {
  bucket = aws_s3_bucket.access_logs.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "access_logs" {
  bucket                  = aws_s3_bucket.access_logs.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_ownership_controls" "access_logs" {
  bucket = aws_s3_bucket.access_logs.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }

  depends_on = [
    aws_s3_bucket_policy.access_logs,
    aws_s3_bucket_public_access_block.access_logs
  ]
}

# holden:ignore:HLD_AWS_281: S3 writes each access-log object once and never modifies
# it, so there are no noncurrent versions; retention is bounded by the lifecycle rules
resource "aws_s3_bucket_versioning" "access_logs" {
  bucket = aws_s3_bucket.access_logs.bucket

  versioning_configuration {
    status = "Disabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "access_logs" {
  bucket = aws_s3_bucket.access_logs.bucket

  rule {
    id     = "Delete old incomplete multi-part uploads"
    status = "Enabled"

    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }
  }

  rule {
    id     = "Age out access logs"
    status = "Enabled"

    dynamic "transition" {
      for_each = local.log_transitions

      content {
        days          = transition.value
        storage_class = "STANDARD_IA"
      }
    }

    dynamic "expiration" {
      for_each = local.log_expirations

      content {
        days = expiration.value
      }
    }
  }
}

# Since April 2023 S3 delivers server access logs via this bucket policy, not
# via an ACL — and BucketOwnerEnforced above makes ACL-based delivery
# impossible in any case. Written with jsonencode rather than an
# aws_iam_policy_document data source so the statements stay statically
# analysable: a data source carrying unresolvable values yields no document at
# all to policy engines, which then abstain on every statement-level check.
resource "aws_s3_bucket_policy" "access_logs" {
  bucket = aws_s3_bucket.access_logs.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowS3ServerAccessLogsDelivery"
        Effect    = "Allow"
        Principal = { Service = "logging.s3.amazonaws.com" }
        Action    = "s3:PutObject"
        Resource  = "${aws_s3_bucket.access_logs.arn}/*"
        Condition = {
          ArnLike      = { "aws:SourceArn" = aws_s3_bucket.cloudwatch_bin.arn }
          StringEquals = { "aws:SourceAccount" = data.aws_caller_identity.current.account_id }
        }
      },
      {
        Sid       = "DenyInsecureTransport"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          aws_s3_bucket.access_logs.arn,
          "${aws_s3_bucket.access_logs.arn}/*"
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

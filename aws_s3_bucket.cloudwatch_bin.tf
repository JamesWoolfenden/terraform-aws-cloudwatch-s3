# holden:ignore:HLD_AWS_310: Object Lock needs versioning, deliberately Disabled below,
# and can only be set at bucket creation — enabling it would replace existing buckets
resource "aws_s3_bucket" "cloudwatch_bin" {
  bucket = var.log_bucket
}

resource "aws_s3_bucket_server_side_encryption_configuration" "cloudwatch_bin" {
  bucket = aws_s3_bucket.cloudwatch_bin.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.sse_algorithm
      kms_master_key_id = var.kms_master_key_id
    }
  }
}

resource "aws_s3_bucket_logging" "cloudwatch_bin" {
  bucket = aws_s3_bucket.cloudwatch_bin.bucket

  target_bucket = aws_s3_bucket.access_logs.bucket
  target_prefix = "${aws_s3_bucket.cloudwatch_bin.bucket}/"
}

# holden:ignore:HLD_AWS_281: write-once CloudWatch log sink; versioning would duplicate
# every delivered object for no recovery benefit. Retention is the lifecycle rules.
resource "aws_s3_bucket_versioning" "cloudwatch_bin" {
  bucket = aws_s3_bucket.cloudwatch_bin.bucket

  versioning_configuration {
    status     = "Disabled"
    mfa_delete = var.log_bucket_mfa_delete
  }
}

resource "aws_s3_bucket_notification" "log_deletes" {
  bucket = aws_s3_bucket.cloudwatch_bin.id

  topic {
    topic_arn = aws_sns_topic.log_deletes.arn
    events    = var.s3_events
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "expire" {
  bucket = aws_s3_bucket.cloudwatch_bin.bucket

  rule {
    id     = "Delete old incomplete multi-part uploads"
    status = "Enabled"

    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }
  }

  rule {
    id     = "Age out delivered logs"
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

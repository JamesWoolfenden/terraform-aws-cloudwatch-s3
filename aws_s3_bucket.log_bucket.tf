
resource "aws_s3_bucket" "log_bucket" {
  # tfsec:ignore:AWS077
  # checkov:skip=CKV_AWS_144: Not relevant
  # checkov:skip=CKV_AWS_21: "Ensure all data stored in the S3 bucket have versioning enabled"
  # checkov:skip=CKV_AWS_18: "Ensure the S3 bucket has access logging enabled"
  # checkov:skip=CKV_AWS_19:v4 legacy
  # checkov:skip=CKV_AWS_145:v4 legacy
  # checkov:skip=CKV2_AWS_37:Faulty
  bucket = var.log_bucket
}

resource "aws_s3_bucket_server_side_encryption_configuration" "log_bucket" {
  bucket = aws_s3_bucket.log_bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.sse_algorithm
      kms_master_key_id = var.kms_master_key_id
    }
  }
}

resource "aws_s3_bucket_logging" "name" {
  count = var.log_bucket_logging != null ? 1 : 0

  bucket = aws_s3_bucket.log_bucket.bucket

  target_bucket = var.log_bucket_logging
  target_prefix = "${aws_s3_bucket.log_bucket.bucket}/"
}

resource "aws_s3_bucket_versioning" "log_bucket" {
  bucket = aws_s3_bucket.log_bucket.bucket

  versioning_configuration {
    status     = "Disabled"
    mfa_delete = var.log_bucket_mfa_delete
  }
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.log_bucket.id

  topic {
    topic_arn     = aws_sns_topic.log_deletes.arn
    events        = var.s3_events
    filter_suffix = ".log"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "expire" {
  bucket = aws_s3_bucket.log_bucket.bucket

  rule {
    id     = "Keep previous version 1 year"
    status = "Enabled"

    noncurrent_version_expiration {
      noncurrent_days = 365
    }
  }

  rule {
    id     = "Delete old incomplete multi-part uploads"
    status = "Enabled"

    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }
  }
}

resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = aws_s3_bucket.log_bucket.id

  rule {
    object_ownership = "ObjectWriter"
  }

  # This `depends_on` is to prevent "A conflicting conditional operation is currently in progress against this resource."
  depends_on = [
    aws_s3_bucket_policy.log_bucket_policy,
    aws_s3_bucket_public_access_block.bucket,
    aws_s3_bucket.log_bucket
  ]
}

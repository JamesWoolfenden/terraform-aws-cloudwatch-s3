
resource "aws_s3_bucket" "log_bucket" {
  # tfsec:ignore:AWS077
	# checkov:skip=CKV_AWS_144: Not relevant
  # checkov:skip=CKV_AWS_21: "Ensure all data stored in the S3 bucket have versioning enabled"
  # checkov:skip=CKV_AWS_18: "Ensure the S3 bucket has access logging enabled"
  bucket = var.log_bucket
  acl    = "log-delivery-write"

  versioning {
    enabled    = false
    mfa_delete = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = var.sse_algorithm
        kms_master_key_id = var.kms_master_key_id
      }
    }
  }

  tags = var.common_tags
}

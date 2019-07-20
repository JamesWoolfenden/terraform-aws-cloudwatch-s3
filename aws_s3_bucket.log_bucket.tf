resource "aws_s3_bucket" "log_bucket" {
  bucket = "${var.log_bucket}-${data.aws_caller_identity.current.account_id}"
  acl    = "log-delivery-write"

  tags = var.common_tags
}

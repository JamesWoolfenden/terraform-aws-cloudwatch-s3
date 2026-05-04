data "aws_iam_policy_document" "topic" {
  # checkov:skip=CKV_AWS_290: IAM policy requires broad write access for this module to function
  # checkov:skip=CKV_AWS_355: IAM policy requires wildcard resource for this module to function
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }

    actions   = ["SNS:Publish"]
    resources = ["arn:aws:sns:*:*:${local.sns_topic_name}"]

    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values   = [aws_s3_bucket.cloudwatch_bin.arn]
    }
  }
}
resource "aws_sns_topic" "log_deletes" {
  name              = local.sns_topic_name
  policy            = data.aws_iam_policy_document.topic.json
  kms_master_key_id = var.kms_master_key_id
}

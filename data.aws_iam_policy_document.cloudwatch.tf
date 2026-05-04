data "aws_iam_policy_document" "cloudwatch" {
  # checkov:skip=CKV_AWS_290: IAM policy requires broad write access for this module to function
  # checkov:skip=CKV_AWS_355: IAM policy requires wildcard resource for this module to function
  statement {
    actions   = ["firehose:*"]
    resources = ["arn:aws:firehose:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:*"]
  }

  statement {
    actions   = ["iam:PassRole"]
    resources = [aws_iam_role.cwl.arn]
  }

  version = "2012-10-17"
}

data "aws_iam_policy_document" "cloudwatch" {
  statement {
    actions   = ["firehose:*"]
    resources = ["arn:aws:firehose:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:*"]
  }

  statement {
    actions   = ["iam:PassRole"]
    resources = [aws_iam_role.cwl.arn]
  }
}

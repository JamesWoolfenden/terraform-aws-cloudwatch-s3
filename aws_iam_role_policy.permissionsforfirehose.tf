resource "aws_iam_role_policy" "permissionsforfirehose" {
  # checkov:skip=CKV_AWS_272: Policy requires broad access for this module to function
  # checkov:skip=CKV_AWS_356: Policy requires broad access for this module to function
  role   = aws_iam_role.firehosetos3.id
  policy = data.aws_iam_policy_document.firehose.json
}

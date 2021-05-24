resource "aws_iam_role_policy" "permissionsforfirehose" {
  role   = aws_iam_role.firehosetos3.id
  policy = data.aws_iam_policy_document.firehose.json
}

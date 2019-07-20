resource "aws_iam_role_policy" "permissionsforfirehose" {
  name = "${var.cloudwatch_name}-POLICY"
  role = aws_iam_role.firehosetos3.id

  policy = data.aws_iam_policy_document.firehose.json
}

resource "aws_iam_role_policy" "permissionsforcwl" {
  role   = aws_iam_role.cwl.id
  policy = data.aws_iam_policy_document.cloudwatch.json
}

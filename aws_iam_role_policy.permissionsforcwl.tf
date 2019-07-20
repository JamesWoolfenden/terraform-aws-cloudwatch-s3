resource "aws_iam_role_policy" "permissionsforcwl" {
  name = "${var.cloudwatch_name}-POLICY-CWL"
  role = aws_iam_role.cwl.id

  policy = data.aws_iam_policy_document.cloudwatch.json
}

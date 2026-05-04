resource "aws_iam_role_policy" "permissionsforcwl" {
  # checkov:skip=CKV_AWS_290: Policy requires broad access for this module to function
  # checkov:skip=CKV_AWS_355: Policy requires broad access for this module to function
  # checkov:skip=CKV_AWS_272: Policy requires broad access for this module to function
  # checkov:skip=CKV_AWS_356: Policy requires broad access for this module to function
  role   = aws_iam_role.cwl.id
  policy = data.aws_iam_policy_document.cloudwatch.json
}

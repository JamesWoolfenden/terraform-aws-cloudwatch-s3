resource "aws_iam_role_policy" "permissionsforcwl" {
  name = "${var.cloudwatch_name}-POLICY-CWL"
  role = "${aws_iam_role.cwl.id}"

  policy = <<EOF
{
      "Statement":[
        {
          "Effect":"Allow",
          "Action":["firehose:*"],
          "Resource":["arn:aws:firehose:eu-west-1:${data.aws_caller_identity.current.account_id}:*"]
        },
        {
          "Effect":"Allow",
          "Action":["iam:PassRole"],
          "Resource":["${aws_iam_role.cwl.arn}"]
        }
      ]
}
EOF
}

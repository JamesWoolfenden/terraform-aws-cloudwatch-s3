resource "aws_iam_role" "cwl" {
  name = "${var.cloudwatch_name}-CWLTOKINESIS"

  assume_role_policy = <<EOF
{
    "Statement": {
      "Effect": "Allow",
      "Principal": {
        "Service": "logs.${data.aws_region.current.name}.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
}
EOF
}

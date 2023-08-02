resource "aws_iam_role" "cwl" {
  name = "${var.cloudwatch_stream_name}-CWLTOKINESIS"

  assume_role_policy = <<-EOT
  {
    "Statement": {
      "Effect": "Allow",
      "Principal": {
        "Service": "logs.${data.aws_region.current.name}.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    },
    "Version": "2012-10-17"
  }
  EOT
}

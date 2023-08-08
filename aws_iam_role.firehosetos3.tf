resource "aws_iam_role" "firehosetos3" {
  name = "${var.cloudwatch_stream_name}-FIREHOSETOS3-${upper(var.region_desc)}"

  assume_role_policy = <<-EOT
  {
    "Statement": {
      "Effect": "Allow",
      "Principal": {
        "Service": "firehose.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    },
    "Version": "2012-10-17"
  }
  EOT
}

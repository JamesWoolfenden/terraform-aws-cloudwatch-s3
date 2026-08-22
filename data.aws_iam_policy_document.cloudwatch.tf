data "aws_iam_policy_document" "cloudwatch" {
  statement {
    sid = "PublishToDeliveryStream"

    actions = [
      "firehose:DescribeDeliveryStream",
      "firehose:PutRecord",
      "firehose:PutRecordBatch"
    ]

    resources = [aws_kinesis_firehose_delivery_stream.extended_s3_stream.arn]
  }

  statement {
    sid       = "PassDeliveryStreamRole"
    actions   = ["iam:PassRole"]
    resources = [aws_iam_role.cwl.arn]

    condition {
      test     = "StringEquals"
      variable = "iam:PassedToService"
      values   = ["firehose.amazonaws.com"]
    }
  }

  version = "2012-10-17"
}

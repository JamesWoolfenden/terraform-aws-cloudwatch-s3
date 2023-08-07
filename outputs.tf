output "firehosearn" {
  value = aws_iam_role.firehosetos3.arn
}

output "cwlrolearn" {
  value = aws_iam_role.cwl.arn
}

output "cloudwatch_bin" {
  value = aws_s3_bucket.cloudwatch_bin
}

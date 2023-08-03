output "firehosearn" {
  value = aws_iam_role.firehosetos3.arn
}

output "cwlrolearn" {
  value = aws_iam_role.cwl.arn
}

output "log_bucket" {
  value = aws_s3_bucket.log_bucket
}

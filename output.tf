output "firehosearn" {
  value = aws_iam_role.firehosetos3.arn
}

output "cwlrolearn" {
  value = aws_iam_role.cwl.arn
}

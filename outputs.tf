output "firehosearn" {
  description = "ARN of the IAM role assumed by Kinesis Firehose to write to the log bucket."
  value       = aws_iam_role.firehosetos3.arn
}
output "cwlrolearn" {
  description = "ARN of the IAM role assumed by CloudWatch Logs to publish to the Firehose delivery stream."
  value       = aws_iam_role.cwl.arn
}
output "cloudwatch_bin" {
  description = "The S3 bucket resource that CloudWatch logs are delivered into."
  value       = aws_s3_bucket.cloudwatch_bin
}

output "firehosearn" {
  description = "ARN of the IAM role assumed by Kinesis Firehose to write to the log bucket."
  value       = module.cloudwatchtos3.firehosearn
}

output "cwlrolearn" {
  description = "ARN of the IAM role assumed by CloudWatch Logs to publish to the Firehose delivery stream."
  value       = module.cloudwatchtos3.cwlrolearn
}

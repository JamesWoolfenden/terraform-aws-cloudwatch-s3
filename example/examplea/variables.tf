variable "cloudwatch_stream_name" {
  type        = string
  description = "Name of the Kinesis Firehose delivery stream created by the module."

  validation {
    condition     = can(regex("^[a-zA-Z0-9_.-]{1,64}$", var.cloudwatch_stream_name))
    error_message = "The cloudwatch_stream_name must be 1-64 characters of letters, numbers, underscores, hyphens or periods."
  }
}
variable "log_bucket" {
  type        = string
  description = "The name of the bucket to stream all the logs to."

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9.-]{1,61}[a-z0-9]$", var.log_bucket))
    error_message = "The log_bucket must be a valid S3 bucket name: 3-63 lowercase characters, starting and ending alphanumeric."
  }
}
variable "filter_pattern" {
  type        = string
  description = "The CloudWatch Logs filter pattern applied to each subscription filter."

  validation {
    condition     = length(var.filter_pattern) <= 1024
    error_message = "The filter_pattern must be 1024 characters or fewer."
  }
}
variable "region_desc" {
  type        = string
  description = "Region"

  validation {
    condition     = can(regex("^[a-zA-Z0-9-]{1,32}$", var.region_desc))
    error_message = "The region_desc must be 1-32 characters of letters, numbers or hyphens."
  }
}
variable "log_group_name" {
  type        = list(any)
  description = "The name of the log group to stream"

  validation {
    condition     = length(var.log_group_name) > 0
    error_message = "The log_group_name must contain at least one log group name."
  }
}
variable "common_tags" {
  type        = map(any)
  description = "Supplied to provider default tags"

  validation {
    condition     = length(var.common_tags) > 0
    error_message = "The common_tags map must contain at least one tag."
  }
}

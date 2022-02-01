variable "cloudwatch_stream_name" {
  type        = string
  description = ""
}

variable "log_bucket" {
  type        = string
  description = "The name of the bucket to stream all the logs to."
}

variable "filter_pattern" {
  type        = string
  description = "description"
}

variable "region_desc" {
  type        = string
  description = "Region"
}

variable "log_group_name" {
  type        = list(any)
  description = "The name of the log group to stream"
}

variable "common_tags" {
  type        = map(any)
  description = "Supplied to provider default tags"
}

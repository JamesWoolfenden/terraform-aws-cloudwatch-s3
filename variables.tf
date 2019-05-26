variable "cloudwatch_name" {
  description = ""
  type=string
}

variable "region" {
  description = "description"
  default     = "eu-west-1"
  type=string
}

variable "log_bucket" {
  description = ""
  type=string
}

variable "log_name" {
  description = ""
  type=string
}

variable "log_stream" {
  description = "A log stream to watch"
  type=string
}

variable "filter_pattern" {
  description = "description"
  default     = "description"
}

variable "region_desc" {
  description = "Region"
  type=string
}

variable "log_group_name" {
  default = "/var/log/messages"
  description="A default log group name"
  type=string
}

variable "common_tags" {
  type = "map"
  description="Implements the common tags scheme"
}

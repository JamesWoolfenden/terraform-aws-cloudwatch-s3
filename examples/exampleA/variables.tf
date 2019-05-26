variable "cloudwatch_name" {
  description = ""
}

variable "log_bucket" {
  description = ""
}

variable "log_name" {
  description = ""
}

variable "log_stream" {
  description = ""
}

variable "filter_pattern" {
  description = "description"
  default     = "description"
}

variable "region_desc" {
  description = "Region"
}

variable "log_group_name" {
  default = "/var/log/messages"
}

variable "common_tags" {
  type = "map"
}

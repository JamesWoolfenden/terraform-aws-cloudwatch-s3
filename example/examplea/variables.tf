variable "cloudwatch_name" {
  type        = string
  description = ""
}

variable "log_bucket" {
  type        = string
  description = ""
}

variable "log_name" {
  type        = string
  description = ""
}

variable "filter_pattern" {
  type        = string
  description = "description"
  default     = ""
}

variable "region_desc" {
  type        = string
  description = "Region"
}

variable "log_group_name" {
  type    = string
  default = "/var/log/messages"
}

variable "common_tags" {
  type        = map(any)
  description = "Supplied to provider default tags"
}

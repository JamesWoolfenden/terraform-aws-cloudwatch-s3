variable "cloudwatch_name" {
  description = ""
}

variable "region" {
  description = "description"
  default     = "eu-west-1"
}

variable "region_secondary" {
  description = "description"
  default     = "eu-west-2"
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

# this is enables you to add dependancies
variable depends_on {
  default     = []
  description = "This is a way to make a module depends on, which isnt built in."
  type        = "list"
}

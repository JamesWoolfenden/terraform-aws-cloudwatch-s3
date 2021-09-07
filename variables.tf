variable "cloudwatch_name" {
  description = ""
  type        = string
}

variable "log_bucket" {
  description = ""
  type        = string
}

//If you set this as the default its going to make it
//hard to delete
variable "log_bucket_mfa_delete" {
  default = false
  type    = bool
}

variable "log_name" {
  description = ""
  type        = string
}

variable "log_stream" {
  description = "A log stream to watch"
  type        = string
}

variable "filter_pattern" {
  type        = string
  description = "description"
  default     = ""
}

variable "region_desc" {
  description = "Region"
  type        = string
}

variable "log_group_name" {
  default     = "/var/log/messages"
  description = "A default log group name"
  type        = string
}

variable "common_tags" {
  type        = map(any)
  description = "Implements the common tags scheme"
}

variable "sse_algorithm" {
  type        = string
  description = "encryption algorithm to use"
  default     = "aws:kms"
}

variable "kms_master_key_id" {
  type        = string
  description = "kms key id"
  default     = "aws/s3"
}

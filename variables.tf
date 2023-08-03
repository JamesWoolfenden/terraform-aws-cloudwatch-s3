variable "cloudwatch_stream_name" {
  description = ""
  type        = string
}

variable "log_bucket" {
  description = ""
  type        = string
}

variable "log_bucket_logging" {
  description = "Access bucket logging."
  type        = string
}

//If you set this as the default its going to make it
//hard to delete
variable "log_bucket_mfa_delete" {
  default = "Disabled"
  type    = string
}

variable "filter_pattern" {
  type        = string
  description = "description"
}

variable "region_desc" {
  description = "A string used to help name stuff doesnt have to be a region"
  type        = string
}

variable "log_group_name" {
  description = "A log group to stream"
  type        = list(any)
}

variable "sse_algorithm" {
  type        = string
  description = "The Encryption algorithm to use"
  default     = "aws:kms"
}

variable "kms_master_key_id" {
  type        = string
  description = "The KMS key id to use for Encryption"
}

variable "server_side_encryption" {
  type        = bool
  description = "Encrypt at rest"
  default     = true
}


variable "s3_events" {
  description = "Events to notify on"
  default     = ["s3:ObjectRemoved:*"]
}

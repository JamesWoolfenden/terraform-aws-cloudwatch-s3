variable "cloudwatch_stream_name" {
  description = "Name of the Kinesis Firehose delivery stream, also used as the prefix for the IAM roles this module creates."
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9_.-]{1,64}$", var.cloudwatch_stream_name))
    error_message = "The cloudwatch_stream_name must be 1-64 characters of letters, numbers, underscores, hyphens or periods."
  }
}

variable "log_bucket" {
  description = "Name of the S3 bucket to create and stream all the logs to."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9.-]{1,61}[a-z0-9]$", var.log_bucket)) && !can(regex("[.][.]|^([0-9]{1,3}[.]){3}[0-9]{1,3}$", var.log_bucket))
    error_message = "The log_bucket must be a valid S3 bucket name: 3-63 lowercase characters, starting and ending alphanumeric, no consecutive periods and not formatted as an IP address."
  }
}

variable "log_bucket_logging" {
  description = "Name for the server-access-log bucket this module creates. Defaults to \"LOG_BUCKET-access-logs\". This is a name to assign, not an existing bucket: the module owns the target so it can guarantee the encryption, bucket policy and ownership settings that log delivery requires."
  type        = string
  default     = null

  validation {
    condition     = var.log_bucket_logging == null || can(regex("^[a-z0-9][a-z0-9.-]{1,61}[a-z0-9]$", var.log_bucket_logging))
    error_message = "The log_bucket_logging must be null or a valid S3 bucket name: 3-63 lowercase characters, starting and ending alphanumeric."
  }
}

# If you set this as the default its going to make it
# hard to delete
variable "log_bucket_mfa_delete" {
  description = "Whether MFA delete is required on the log bucket. Setting this to Enabled makes the bucket hard to delete."
  default     = "Disabled"
  type        = string

  validation {
    condition     = contains(["Enabled", "Disabled"], var.log_bucket_mfa_delete)
    error_message = "The log_bucket_mfa_delete must be either Enabled or Disabled."
  }
}

variable "filter_pattern" {
  type        = string
  description = "The CloudWatch Logs filter pattern applied to each subscription filter. An empty string matches every log event."

  validation {
    condition     = length(var.filter_pattern) <= 1024
    error_message = "The filter_pattern must be 1024 characters or fewer."
  }
}

variable "region_desc" {
  description = "A string used to help name stuff doesnt have to be a region"
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9-]{1,32}$", var.region_desc))
    error_message = "The region_desc must be 1-32 characters of letters, numbers or hyphens."
  }
}

variable "log_group_name" {
  description = "A log group to stream"
  type        = list(string)

  validation {
    condition     = length(var.log_group_name) > 0
    error_message = "The log_group_name must contain at least one log group name."
  }

  validation {
    condition     = alltrue([for name in var.log_group_name : can(regex("^[a-zA-Z0-9_./#-]{1,512}$", name))])
    error_message = "Each log_group_name entry must be 1-512 characters of letters, numbers or the characters _ . / # -."
  }
}

variable "sse_algorithm" {
  type        = string
  description = "The Encryption algorithm to use"
  default     = "aws:kms"

  validation {
    condition     = contains(["aws:kms", "aws:kms:dsse", "AES256"], var.sse_algorithm)
    error_message = "The sse_algorithm must be one of aws:kms, aws:kms:dsse or AES256."
  }
}

# The module encrypts a CloudWatch log group with this key. CloudWatch Logs
# calls KMS as the service principal, so the key policy must grant
# logs.REGION.amazonaws.com directly — an IAM grant to the account root does
# not reach it, and the log group will fail to create.
variable "kms_master_key_id" {
  type        = string
  description = "The KMS key id to use for Encryption. Its key policy must grant the CloudWatch Logs service principal (logs.REGION.amazonaws.com) encrypt/decrypt/describe, since the module encrypts a log group with it."

  validation {
    condition     = can(regex("^(arn:aws[a-zA-Z-]*:kms:[a-z0-9-]+:[0-9]{12}:(key|alias)/.+|alias/.+|[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})$", var.kms_master_key_id))
    error_message = "The kms_master_key_id must be a KMS key ARN, key alias ARN, an alias/<name> string or a key UUID."
  }
}

variable "server_side_encryption" {
  type        = bool
  description = "Encrypt at rest"
  default     = true
}

variable "s3_events" {
  description = "Events to notify on"
  type        = list(string)
  default     = ["s3:ObjectRemoved:*"]

  validation {
    condition     = length(var.s3_events) > 0 && alltrue([for event in var.s3_events : can(regex("^s3:[A-Za-z]+:", event))])
    error_message = "Each s3_events entry must be an S3 event type such as s3:ObjectRemoved:* or s3:ObjectCreated:Put."
  }
}

variable "firehose_error_log_retention_days" {
  description = "Retention in days for the CloudWatch log group holding Firehose delivery errors."
  type        = number
  default     = 365

  validation {
    condition     = contains([1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1096, 1827, 2192, 2557, 2922, 3288, 3653], var.firehose_error_log_retention_days)
    error_message = "The firehose_error_log_retention_days must be one of the retention periods CloudWatch Logs accepts."
  }
}

variable "log_transition_days" {
  description = "Days before a delivered log object transitions to the STANDARD_IA storage class. Set to null to skip the transition."
  type        = number
  default     = 30

  validation {
    condition     = var.log_transition_days == null || var.log_transition_days >= 30
    error_message = "The log_transition_days must be null or at least 30; S3 bills a minimum 30-day duration for STANDARD_IA regardless of when the object transitions."
  }
}

variable "log_expiration_days" {
  description = "Days before a delivered log object is deleted. Set to null to retain objects indefinitely."
  type        = number
  default     = 365

  validation {
    condition     = var.log_expiration_days == null || var.log_expiration_days > 0
    error_message = "The log_expiration_days must be null or greater than zero."
  }
}

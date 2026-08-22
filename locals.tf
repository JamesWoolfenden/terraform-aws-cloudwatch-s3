locals {
  sns_topic_name    = "s3-event-notification-topic-${aws_s3_bucket.cloudwatch_bin.bucket}"
  access_log_bucket = coalesce(var.log_bucket_logging, "${var.log_bucket}-access-logs")

  # Both retention steps are optional: a null variable means "skip this step",
  # expressed as an empty list so the corresponding dynamic block emits nothing.
  log_transitions = var.log_transition_days == null ? [] : [var.log_transition_days]
  log_expirations = var.log_expiration_days == null ? [] : [var.log_expiration_days]
}

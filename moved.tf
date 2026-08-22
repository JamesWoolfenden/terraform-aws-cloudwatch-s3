# The S3 notification resource was renamed from "bucket_notification" to
# "log_deletes"; this preserves existing state addresses.
moved {
  from = aws_s3_bucket_notification.bucket_notification
  to   = aws_s3_bucket_notification.log_deletes
}

# aws_cloudwatch_log_subscription_filter.filters moved from count to for_each,
# keyed on the log group name. The keys come from var.log_group_name, so this
# migration cannot be expressed as static moved blocks in the module. Existing
# consumers must run, once per log group, before their next apply:
#
#   terraform state mv \
#     'module.<name>.aws_cloudwatch_log_subscription_filter.filters[0]' \
#     'module.<name>.aws_cloudwatch_log_subscription_filter.filters["<log-group-name>"]'

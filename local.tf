locals {
    sns_topic_name="s3-event-notification-topic-${aws_s3_bucket.log_bucket.bucket}"
}

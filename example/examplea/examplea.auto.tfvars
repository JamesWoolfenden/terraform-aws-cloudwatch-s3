cloudwatch_stream_name = "cloudlogger"
log_bucket             = "123454-logbucket"
log_group_name         = ["jenkins"]
region_desc            = "euwest1"
filter_pattern         = "value"
common_tags = {
  createby = "terraform"
  module   = "terraform-aws-cloudwatch-s3"
}

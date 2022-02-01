module "cloudwatchtos3" {
  source                 = "../../"
  cloudwatch_stream_name = var.cloudwatch_stream_name
  log_bucket             = var.log_bucket
  region_desc            = var.region_desc
  filter_pattern         = var.filter_pattern
  log_group_name         = [aws_cloudwatch_log_group.example.name]
  kms_master_key_id      = aws_kms_key.example.arn
}

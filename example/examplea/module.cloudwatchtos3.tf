module "cloudwatchtos3" {
  source          = "../../"
  cloudwatch_name = var.cloudwatch_name
  log_bucket      = var.log_bucket
  log_name        = var.log_name
  region_desc     = var.region_desc
  filter_pattern  = var.filter_pattern
}

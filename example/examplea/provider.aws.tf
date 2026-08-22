provider "aws" {
  region = "eu-west-2"
  default_tags {
    tags = {
      createby = "terraform"
      module   = "terraform-aws-cloudwatch-s3"
    }
  }
}

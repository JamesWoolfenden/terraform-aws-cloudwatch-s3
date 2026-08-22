# holden:ignore:HLD_TF_004: disposable test fixture applied and destroyed by CI;
# it deliberately keeps state local rather than claiming a shared remote backend
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.43.0"
    }
  }
  required_version = ">= 1.5.0"
}

provider "aws" {
  version = "1.54"
  region  = "eu-west-2"
}

provider "aws" {
  alias   = "dublin"
  version = "1.54"
  region  = "eu-west-1"
}

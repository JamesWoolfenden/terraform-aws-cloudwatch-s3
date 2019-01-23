provider "aws" {
  version = "1.54"
  region  = "${var.region}"
}

provider "aws" {
  alias   = "dublin"
  version = "1.54"
  region  = "${var.region_secondary}"
}

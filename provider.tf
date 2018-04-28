provider "aws" {
  version = "~> 1.14.1"
  region  = "${var.region}"
}

provider "template" {
  version = "~> 1.0"
}

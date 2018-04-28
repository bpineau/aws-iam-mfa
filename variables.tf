variable "region" {
  description = "The AWS region"
  default     = "eu-west-1"
}

variable "users" {
  type        = "map"
  description = "All real users and their public PGP keys"

  default = {
    /*
    The PGP key can be provided inline (base64 encoded), or as a keybase ref:
    foo = "base-64 encoded PGP public key
    bar = "keybase:baruserid"
    */

    bpineau = "keybase:bpineau"
  }
}

variable "admin_users" {
  type        = "list"
  description = "Users with full AWS access rights"

  default = [
    "bpineau",
  ]
}

variable "unprivileged_users" {
  type        = "list"
  description = "Users with restricted AWS access rights"

  default = []
}

data "aws_caller_identity" "current" {}

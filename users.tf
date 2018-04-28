// We have to repeat users here (rather than using a simple count and
// iterate of the var.users map) to prevent Terraform from recreating
// most users when we'll need to remove one user in the middle of the list.
// This is a known Terraform limitations, see for instance:
// https://github.com/hashicorp/terraform/issues/3449#issuecomment-294915992

module "user-bpineau" {
  source  = "modules/user"
  user    = "bpineau"
  pgp_key = "${lookup(var.users, "bpineau")}"
  policy  = "${aws_iam_policy.force-mfa.arn}"
}

output "output-bpineau" {
  value = "${module.user-bpineau.account-infos}"
}

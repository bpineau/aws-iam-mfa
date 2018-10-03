data "template_file" "accounts-infos" {
  template = "${file("${path.module}/infos.tpl")}"

  vars {
    user       = "${var.user}"
    password   = "${aws_iam_user_login_profile.profile.encrypted_password}"
    access_key = "${aws_iam_access_key.accesskey.id}"
    secret_key = "${aws_iam_access_key.accesskey.encrypted_secret}"
    aws_url    = "https://${data.aws_iam_account_alias.current.account_alias}.signin.aws.amazon.com/console"
  }
}

output "account-infos" {
  value = "${data.template_file.accounts-infos.rendered}"
}

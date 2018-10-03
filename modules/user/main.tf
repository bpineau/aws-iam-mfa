resource "aws_iam_user" "user" {
  name          = "${var.user}"
  force_destroy = true
}

resource "aws_iam_access_key" "accesskey" {
  user    = "${aws_iam_user.user.name}"
  pgp_key = "${var.pgp_key}"
}

resource "aws_iam_user_login_profile" "profile" {
  user    = "${var.user}"
  user    = "${aws_iam_user.user.name}"
  pgp_key = "${var.pgp_key}"

  password_reset_required = true
}

resource "aws_iam_user_policy_attachment" "attach-force-mfa-policy" {
  user       = "${aws_iam_user.user.name}"
  policy_arn = "${var.policy}"
}

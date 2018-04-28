// Role

resource "aws_iam_role" "readonly-role" {
  assume_role_policy = "${data.aws_iam_policy_document.assume-from-mfa.json}"
  name               = "readonly-role"
}

resource "aws_iam_role_policy_attachment" "readonly-role-grants" {
  role       = "${aws_iam_role.readonly-role.name}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

// A policy we'll attach to selected groups to allow them using this role

data "aws_iam_policy_document" "assume-readonly-role" {
  statement {
    sid       = "TfCustomPolicyAssumeReadOnlyRole"
    effect    = "Allow"
    actions   = ["sts:AssumeRole"]
    resources = ["${aws_iam_role.readonly-role.arn}"]
  }
}

resource "aws_iam_policy" "assume-readonly-role" {
  name        = "tf-assume-readonly-role"
  description = "Allow to assume the readonly-role"
  policy      = "${data.aws_iam_policy_document.assume-readonly-role.json}"
}

// Groups bindings

resource "aws_iam_group_policy_attachment" "attach-readonly-to-unprivileged-group" {
  group      = "${aws_iam_group.unprivileged-group.name}"
  policy_arn = "${aws_iam_policy.assume-readonly-role.arn}"
}

resource "aws_iam_group_policy_attachment" "attach-readonly-to-admin-group" {
  group      = "${aws_iam_group.admin-group.name}"
  policy_arn = "${aws_iam_policy.assume-readonly-role.arn}"
}

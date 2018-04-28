// Role

resource "aws_iam_role" "admin-role" {
  assume_role_policy = "${data.aws_iam_policy_document.assume-from-mfa.json}"
  name               = "admin-role"
}

resource "aws_iam_role_policy_attachment" "admin-role-grants" {
  role       = "${aws_iam_role.admin-role.name}"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

// A policy we'll attach to selected groups to allow them using this role

data "aws_iam_policy_document" "assume-admin-role" {
  statement {
    sid       = "TfCustomPolicyAssumeAdminRole"
    effect    = "Allow"
    actions   = ["sts:AssumeRole"]
    resources = ["${aws_iam_role.admin-role.arn}"]
  }
}

resource "aws_iam_policy" "assume-admin-role" {
  name        = "tf-assume-admin-role"
  description = "Allow to assume the admin-role"
  policy      = "${data.aws_iam_policy_document.assume-admin-role.json}"
}

// Groups bindings

resource "aws_iam_group_policy_attachment" "attach-admin-to-admin-group" {
  group      = "${aws_iam_group.admin-group.name}"
  policy_arn = "${aws_iam_policy.assume-admin-role.arn}"
}

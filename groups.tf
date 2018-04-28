// groups and membership definitions.
// beware the limitations: a given user can be member of 10 groups max.

## Groups definitions

resource "aws_iam_group" "admin-group" {
  name = "admin"
  path = "/"
}

resource "aws_iam_group" "unprivileged-group" {
  name = "unprivileged"
  path = "/"
}

## Groups membership

resource "aws_iam_group_membership" "admin-membership" {
  name  = "tf-admin-membership"
  users = "${var.admin_users}"
  group = "${aws_iam_group.admin-group.name}"
}

resource "aws_iam_group_membership" "unprivileged-membership" {
  name  = "tf-unprivileged-membership"
  users = "${var.unprivileged_users}"
  group = "${aws_iam_group.unprivileged-group.name}"
}

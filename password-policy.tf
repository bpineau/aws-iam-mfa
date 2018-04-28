resource "aws_iam_account_password_policy" "password-policy" {
  minimum_password_length        = 8
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = false
  allow_users_to_change_password = true

  # password_reuse_prevention = true
  # max_password_age = 60
}
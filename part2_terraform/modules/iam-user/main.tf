# Create user
resource "aws_iam_user" "this" {
  name = var.name
}

# Generate API keys for the user (for system and for human)
resource "aws_iam_access_key" "this" {
  user = aws_iam_user.this.name
}

# Generate password only for the human user
resource "aws_iam_user_login_profile" "this" {
  count = var.system ? 0 : 1

  user            = aws_iam_user.this.name
  password_length = 20
  pgp_key         = var.pgp_key

  password_reset_required = true
}

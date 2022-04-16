data "aws_iam_policy_document" "s3_policy" {
  statement {
    principals {
      type = "AWS"
      identifiers = [for v in module.system_user: v.user_arn]
    }

    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject"
    ]

    resources = [
      module.s3.s3_arn,
      "${module.s3.s3_arn}/*",
    ]
  }

  depends_on = [module.system_user]
}
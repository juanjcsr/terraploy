data "aws_iam_policy_document" "github_oidc" {
    statement {
        actions = [
            "sts:AssumeRoleWithWebIdentity",
        ]
        effect = "Allow"
        principals {
            type        = "Federated"
            identifiers = [aws_iam_openid_connect_provider.github.arn]
        }
        condition {
            test     = "StringEquals"
            variable = "token.actions.githubusercontent.com:aud"
            values   = ["sts.amazonaws.com"]
        }
        condition {
            test     = "StringLike"
            variable = "token.actions.githubusercontent.com:sub"
            values   = [var.github_oidc_repo]
        }
    }
}

data "aws_iam_policy_document" "github_ecr" {
  statement {
    effect  = "Allow"
    actions = [
      "ecr:*",
    ]
    resources = ["*"]
  }
}

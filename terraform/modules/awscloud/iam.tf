resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com",
  ]

    thumbprint_list = [
        "ffffffffffffffffffffffffffffffffffffffff",
    ]
}

resource "aws_iam_role" "github_oidc" {
  name               = "github_oidc"
  assume_role_policy = data.aws_iam_policy_document.github_oidc.json
}

resource "aws_iam_policy" "github_ecr" {
  name        = "github_ecr"
  description = "Policy to allow GitHub actions to push to ECR"
  policy      = data.aws_iam_policy_document.github_ecr.json
}

resource "aws_iam_role_policy_attachment" "github_ecr" {
  role       = aws_iam_role.github_oidc.name
  policy_arn = aws_iam_policy.github_ecr.arn
}

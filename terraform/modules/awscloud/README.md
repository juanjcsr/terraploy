## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecr_repository.terraploy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_iam_openid_connect_provider.github](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_policy.github_ecr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.github_oidc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.github_ecr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.github_ecr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.github_oidc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ecr_repo_name"></a> [ecr\_repo\_name](#input\_ecr\_repo\_name) | The name of the ECR repository | `string` | `"terraploy"` | no |
| <a name="input_ecr_repos_names"></a> [ecr\_repos\_names](#input\_ecr\_repos\_names) | The names of the ECR repositories | `list(string)` | n/a | yes |
| <a name="input_github_oidc_repo"></a> [github\_oidc\_repo](#input\_github\_oidc\_repo) | The name of the GitHub repository | `string` | `"repo:juanjcsr/terraploy:*"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecr_repo_arn"></a> [ecr\_repo\_arn](#output\_ecr\_repo\_arn) | The ARN of the ECR repository |
| <a name="output_ecr_repo_names"></a> [ecr\_repo\_names](#output\_ecr\_repo\_names) | The name of the ECR repository |
| <a name="output_ecr_repo_registry_id"></a> [ecr\_repo\_registry\_id](#output\_ecr\_repo\_registry\_id) | The registry ID of the ECR repository |
| <a name="output_ecr_repo_url"></a> [ecr\_repo\_url](#output\_ecr\_repo\_url) | The URL of the ECR repository |

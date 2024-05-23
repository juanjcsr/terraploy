## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.13.2 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.11.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_awscloud"></a> [awscloud](#module\_awscloud) | ./modules/awscloud | n/a |
| <a name="module_kubernetes"></a> [kubernetes](#module\_kubernetes) | ./modules/kubernetes | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ecr_repo_name"></a> [ecr\_repo\_name](#input\_ecr\_repo\_name) | The name of the ECR repository | `string` | `"terraploy"` | no |
| <a name="input_ecr_repos_names"></a> [ecr\_repos\_names](#input\_ecr\_repos\_names) | The names of the ECR repositories | `list(string)` | n/a | yes |
| <a name="input_github_oidc_repo"></a> [github\_oidc\_repo](#input\_github\_oidc\_repo) | The name of the GitHub repository | `string` | `"repo:juanjcsr/terraploy:*"` | no |
| <a name="input_kube_context"></a> [kube\_context](#input\_kube\_context) | The name of the Kubernetes context | `string` | `"minikube"` | no |

## Outputs

No outputs.

Other deploy

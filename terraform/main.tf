
# module "awscloud" {
#   source = "./modules/awscloud"

#   ecr_repo_name = var.ecr_repo_name

#   ecr_repos_names = var.ecr_repos_names

#   github_oidc_repo = var.github_oidc_repo
# }

module "kubernetes" {
  source = "./modules/kubernetes"

  kube_context = var.kube_context
}


module "awscloud" {
  source = "./modules/awscloud"

  ecr_repo_name = "terraploy"

  ecr_repos_names = [
    "simpleserver",
    "otraapp"
  ]
}

module "kubernetes" {
  source = "./modules/kubernetes"

  kube_context = var.kube_context
}

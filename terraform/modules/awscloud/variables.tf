variable "ecr_repo_name" {
  type        = string
  default     = "terraploy"
  description = "The name of the ECR repository"
}

variable "github_oidc_repo" {
  type        = string
  default     = "repo:juanjcsr/terraploy"
  description = "The name of the GitHub repository"
}

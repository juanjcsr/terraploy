resource "aws_ecr_repository" "terraploy" {
  name = var.ecr_repo_name
  image_tag_mutability = "MUTABLE"
}

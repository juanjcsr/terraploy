resource "aws_ecr_repository" "terraploy" {

  for_each = toset(var.ecr_repos_names)
  name = join("", [var.ecr_repo_name, "/", each.value])

  image_tag_mutability = "IMMUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}

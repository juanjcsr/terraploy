output ecr_repo_name {
    value = aws_ecr_repository.terraploy.name
    description = "The name of the ECR repository"
}

output ecr_repo_url {
    value = aws_ecr_repository.terraploy.repository_url
    description = "The URL of the ECR repository"
}

output ecr_repo_arn {
    value = aws_ecr_repository.terraploy.arn
    description = "The ARN of the ECR repository"
}

output ecr_repo_registry_id {
    value = aws_ecr_repository.terraploy.registry_id
    description = "The registry ID of the ECR repository"
}

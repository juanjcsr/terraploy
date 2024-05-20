output ecr_repo_names {
    value = {
        for repo in aws_ecr_repository.terraploy : repo.name => repo.name
    }
    description = "The name of the ECR repository"
}

output ecr_repo_url {
    value = {
        for repo in aws_ecr_repository.terraploy : repo.name => repo.repository_url
    }
    description = "The URL of the ECR repository"
}

output ecr_repo_arn {
    value = {
        for repo in aws_ecr_repository.terraploy : repo.name => repo.arn
    }
    description = "The ARN of the ECR repository"
}

output ecr_repo_registry_id {
    value = {
        for repo in aws_ecr_repository.terraploy : repo.name => repo.registry_id
    }
    description = "The registry ID of the ECR repository"
}

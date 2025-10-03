provider "aws" {
    region                  = var.aws_region
    access_key              = var.aws_access_key
    secret_key              = var.aws_secret_key
    default_tags {
        tags = {
            Environment = var.environment
            Owner = var.owner
            Project = var.project
            Version = var.version_id
        }
    }
}

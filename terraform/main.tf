terraform {
    required_version = ">= 1.0"
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
      }
    }
    backend "s3" {
      bucket = "cfm-tf-state"
      key = "sfm-api/state"
      region = "ap-southeast-2"
      encrypt = true
    }
}

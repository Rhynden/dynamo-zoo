terraform {
  required_version = "~> 1.6.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "2.4.1"
    }
  }

  # Optionally store tf state in aws s3 bucket
  #  backend "s3" {
  #   bucket = "yourdomain-terraform"
  #   key    = "prod/terraform.tfstate"
  #   region = "eu-central-1"
  # }
}

# Default region to use
provider "aws" {
  region = "eu-central-1"
}

# Provider for Cloudfront etc.
provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
    }
  }

  backend "s3" {
    
  }
}

provider "aws" {
  region  = "us-east-1"
  default_tags {
    tags = {
      Organisation = "Self"
      Environment  = "dev"
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         	   = "hello-world-terraform-state-morrisons-demo"
    key              	   = "state/terraform.tfstate"
    region         	   = "us-east-1"
    encrypt        	   = true
    dynamodb_table = "mycomponents_tf_lockid"
  }
}
# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

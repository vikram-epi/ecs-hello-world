provider "aws" {
  region  = "us-east-1"
  default_tags {
    tags = {
      Organisation = "Self"
      Environment  = "dev"
    }
  }
}

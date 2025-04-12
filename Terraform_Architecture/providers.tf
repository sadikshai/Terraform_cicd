terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.94.1"
    }
  }

  backend "s3" {
    bucket         = "terraformcicdgithubactions"
    key            = "state/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "Terraformdynamodb"
  }
}

provider "aws" {
  region = "ap-south-1"
}

terraform {
  required_version = ">= 1.0.0, < 2.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {

    #
    bucket = "std03-terraform-state"
    key    = "global/s3/terraform.tfstate"
    region = "ap-northeast-2"

    #
    dynamodb_table = "std03-terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

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
    key    = "workspace-example/terraform.tfstate"
    region = "ap-northeast-2"

    #
    dynamodb_table = "std03-terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_instance" "example" {
  ami           = "ami-06eea3cd85e2db8ce"
  instance_type = "t2.micro"

  #
  tags = {
    Name = "std03-example1"
  }
}


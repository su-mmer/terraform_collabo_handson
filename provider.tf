# 프로바이더 설정
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.4.0"
    }
  }

  required_version = ">= 1.4"
}

# aws 설정
provider "aws" {
  region= "ap-northeast-2"  // seoul
  profile = "tfuser"

  default_tags {
    tags = {
      Name = "terraform-eks-example"
    }
  }
}
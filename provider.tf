# 프로바이더 설정
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.4.0"
    }
  }
  cloud {
    organization = "2024_1Q_terraform_study"

    workspaces {
      name = "terraform_collabo_handson"
    }
  }
  required_version = ">= 1.4"
}

# aws 설정
provider "aws" {
  region= "ap-northeast-2"  // seoul
  # profile = "tfuser"

  # default_tags {
  #   tags = {
  #     Name = "terraform-eks-example"
  #   }
  # }
}
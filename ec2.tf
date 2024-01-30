terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  cloud {
    organization = "hee"

    workspaces {
      name = "terraform_collabo_handson"
    }
  }
}

provider "aws" {
  profile = "my-terraform"  // 로컬 aws profile에 등록한 이름
  region = "ap-northeast-2"

  default_tags {
    tags = {
      Name = "example"
    }
  }
}

resource "aws_instance" "ec2" {
  ami = "ami-0a5a6128e65676ebb"
  instance_type = "t2.micro"
}

output "ec2_ip" {
  description = "Public IP address of the EC2 instance"
  sensitive = true  // EC2 private IP 콘솔 출력 X, tf file에만 출력
  value = aws_instance.ec2.private_ip
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  sensitive = true  // EC2 pulbic IP 콘솔 출력 X, tf file에만 출력
  value       = aws_instance.ec2.public_ip
}
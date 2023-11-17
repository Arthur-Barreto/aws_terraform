terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.26.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "ssh_key_pair" {
  source = "./files/ssh_key_pair"
}

module "security_group" {
  source = "./files/security_group"
}

module "ec2_instance" {
  source              = "./files/ec2_instance"
  security_group_name = module.security_group.security_group_name
}

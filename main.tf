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
  source = "./modules/ssh_key_pair"
}

module "vpc" {
  source = "./modules/vpc"
}

module "gateway" {
  source = "./modules/gateway"
  vpc_id = module.vpc.vpc_id
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
}

module "security_group" {
  source = "./modules/security_group"
}

module "ec2_instance" {
  source              = "./modules/ec2_instance"
  security_group_name = module.security_group.security_group_name
}

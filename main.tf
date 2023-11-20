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

module "router_tables" {
  source               = "./modules/router_tables"
  vpc_id               = module.vpc.vpc_id
  private_subnet_count = module.subnet.private_subnet_count
  private_subnet_ids   = module.subnet.private_subnet_ids
  gateway_id           = module.gateway.gateway_id
  public_subnet_count  = module.subnet.public_subnet_count
  public_subnet_ids    = module.subnet.public_subnet_ids

}

module "security_group" {
  source = "./modules/security_group"
}

module "ssh_key_pair" {
  source = "./modules/ssh_key_pair"
}

module "ec2_instance" {
  source              = "./modules/ec2_instance"
  security_group_name = module.security_group.security_group_name
}

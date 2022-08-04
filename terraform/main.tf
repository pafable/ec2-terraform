terraform {
  required_version = "~> 1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {}
}

provider "aws" {
  region = var.region
  assume_role {
    role_arn = var.deployer_role
  }
}

module "ec2_instance" {
  source         = "./modules/ec2"
  deployer_role  = var.deployer_role
  environment    = var.environment
  instance_count = var.instance_count
  instance_type  = var.instance_type
  isDemo         = var.isDemo
  key_name       = var.key_name
  owner          = var.owner
  region         = var.region
  server_name    = var.server_name
}

output "instance_arn" {
  value = module.ec2_instance.arn
}

output "instance_id" {
  value = module.ec2_instance.id
}

output "instance_public_dns" {
  value = module.ec2_instance.pub_dns
}

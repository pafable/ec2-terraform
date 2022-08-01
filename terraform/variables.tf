variable "deployer_role" {
  type = string
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "server_name" {
  type    = string
  default = "my-awesome-server"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "owner" {
  type    = string
  default = "pafable"
}

locals {
  default_tags = {
    Name        = "${var.server_name}"
    environment = var.environment
    owner       = var.owner
    project     = "demo"
  }
}
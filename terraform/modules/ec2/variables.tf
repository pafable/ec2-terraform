variable "deployer_role" {
  type = string
}

variable "environment" {
  type = string
}

variable "instance_count" {
  type = number
}

variable "instance_type" {
  type = string
}

variable "isDemo" {
  type = bool
}

variable "key_name" {
  type = string
}

variable "owner" {
  type = string
}

variable "region" {
  type = string
}

variable "server_name" {
  type = string
}

locals {
  default_tags = {
    Name        = var.server_name
    environment = var.environment
    owner       = var.owner
    demo        = var.isDemo
  }
}

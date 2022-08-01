variable "deployer_role" {
  type    = string
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "server_name" {
  type    = string
  default = "my-awesome-server"
}

variable "tags" {
  type = map(string)
}

variable "environment" {
  type = string
  default = "dev"
}

variable "owner" {
  type = string
  default = "pafable"
}
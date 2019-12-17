data "aws_caller_identity" "current" {}

locals {
  common_tags = {
    namespace = var.namespace
    env       = var.env
    owner     = var.owner
  }
}

variable "vpc_id" {
  default = "vpc"
  type    = string
}

variable "region" {
  type = string
}

variable "namespace" {
  type = string
}

variable "env" {
  type = string
}

variable "owner" {
  type = string
}

variable "additional_tags" {
  default = {}
  type    = map(string)
}

variable "direction" {
  type = string
}

variable "ip_addresses" {
  type = list(object({
    subnet_id = string
    ip        = string
  }))
  #type = list(object({ ip=string, subnet_id=string }))
  #type = set(map(string))
}

variable "allowed_resolvers" {
  default = []
  type    = list(string)
}

variable "owner" {}

variable "environment" {}

variable "lb_name" {}

variable "tg_name" {}

variable "subnets" {
 type = list(string)
}

variable "security_groups" {
  type = list(string)
}

variable "vpc_id" {}
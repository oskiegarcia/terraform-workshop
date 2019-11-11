variable "name" {
  description = "Name of this VPC"
}

variable "owner" {
  description = "Team who manages this resource"
}

variable "environment" {
  description = "Environment - e.g. Dev, Test, Prod"
}

variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
}

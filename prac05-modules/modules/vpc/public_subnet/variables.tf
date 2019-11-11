variable "owner" {
  description = "Team who manages this resource"
}

variable "name" {
  description = "Name of the subnet"
}

variable "environment" {
  description = "Environment - e.g. Dev, Test, Prod"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "igw_id" {
  description = "Internet Gateway ID"
}

variable "az" {
  description = "Availability Zone"
}

variable "subnet_cidr_block" {
  description = "Subnet CIDR block"
}
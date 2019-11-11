variable "vpc_id" {
  description = "VPC ID"
}

variable "name" {
  description = "Name of Security Group"
}

variable "owner" {
  description = "Team who manages this resource"
}

variable "environment" {
  description = "Environment"
}

variable "inbound_desc" {
  description = "Ingress Description"
}

variable "inbound_cidr" {
  description = "Ingress CIDR block"
}

variable "inbound_port_from" {
  description = "Ingress Port From"
}

variable "inbound_port_to" {
  description = "Ingress Port To"
}

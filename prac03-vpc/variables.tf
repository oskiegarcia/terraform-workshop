variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "ap-southeast-1"
}

variable "account_profile" {
  default = "tf_demo"
}

variable "owner" {
  default = "Dream Team"
}

variable "environment" {
  default = "Dev"
}

variable "key_name" {
  default = "tf_demo_key"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "everywhere_cidr" {
  description = "CIDR for access outside AWS network"
  default = "0.0.0.0/0"
}

variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the Public Subnet"
  default = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for the Private Subnet"
  default = "10.0.1.0/24"
}
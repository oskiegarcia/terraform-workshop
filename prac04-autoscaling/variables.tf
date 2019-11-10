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

variable "public_subnet_cidr_az_a" {
  description = "CIDR for the Public Subnet"
  default = "10.0.0.0/24"
}

variable "public_subnet_cidr_az_b" {
  description = "CIDR for the Public Subnet"
  default = "10.0.2.0/24"
}

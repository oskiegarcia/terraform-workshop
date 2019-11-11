variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "ap-southeast-1"
}

variable "account_profile" {
  default = "tf_demo"
}

variable "everywhere_cidr" {
  description = "CIDR for access outside AWS network"
  default = "0.0.0.0/0"
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


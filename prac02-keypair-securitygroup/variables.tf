variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "ap-southeast-1"
}

variable "account_profile" {
  default = "tf_demo"
}

variable "key_name" {
  default = "tf_demo_key"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "owner" {
  default = "Dream Team"
}

variable "environment" {
  default = "Dev"
}

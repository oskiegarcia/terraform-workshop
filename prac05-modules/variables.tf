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
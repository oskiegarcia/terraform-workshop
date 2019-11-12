variable "image_id" {
  description = "Image ID"
}

variable "instance_type" {
  description = "EC2 instance type"
}

variable "key_name" {}

variable "security_groups" {
  type = list(string)
}

variable "vpc_zone_identifier" {
  type = list(string)
}

variable "alb_target_group_arn" {}

variable "user_data_filename" {}

variable "asg_name" {}
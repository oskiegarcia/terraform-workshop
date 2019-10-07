variable "name" {
  type = string
}

variable "service_group" {
  type = string
}

variable "security_groups" {
  type = list(string)
}

variable "subnet_id" {
  type = string
}

variable "availability_zone" {
  type = string
}

variable "root_ebs_size" {
  type    = string
  default = "8"
}

variable "root_vol_type" {
  type    = string
  default = "gp2"
}
variable "public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDsxftkz9ZwgCedt2xtfULUmEymd+gycwSD4oT+actNlCLPIIaxPEdKa1VQ85qNcm8/XtPGqqXj7nVB+6A+9ZKi/jARQxFBZ5S44ams1arPkiCByxth089K0mZq2Sb5GrksCeUViapqGNwIImNg+K+IyX6bOfsnh0AhDqxE7kToH/L+NwRHXo4CzHGWzewF6MgsQvui0MVxHFtzLLck1adwnoaNbmcJ25PYHSZnk0puSUQQSNgAa6mXauGDyv5RIYJ8ZQwyTNo8PjGwLBrhQyM+hdds1B9KulwCtYCk6T754SUPzTSqzFG7RdvDCK1mRx8K92vGCg//UkLJlshReflL hooq.video.team@hooq.tv"
}

variable "size" {
  type    = string
  default = "1"
}

variable "image_id" {
  type    = string
  default = "ami-0355471dc9f264631"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "is_public" {
  type    = string
  default = "false"
}

variable "iam_instance_profile_name" {
  type    = string
  default = ""
}

variable "delete_ebs_on_termination" {
  type    = string
  default = "false"
}

variable "extra_volume" {
  type    = string
  default = ""
}

variable "extra_volume_type" {
  type    = string
  default = "gp2"
}

variable "extra_volume_devicename" {
  type    = string
  default = "/dev/sdf"
}

variable "extra_volume_skipdestroy" {
  type    = string
  default = "true"
}

variable "user_data_base64" {
  type    = string
  default = ""
}

variable "managedBy" {
  type    = string
  default = "oscar"
}

terraform {
  backend "s3" {
    bucket = "oskiegarcia-mybucket"
    key    = "mytf/terraform.tfstate"
    region = "ap-southeast-1"
    profile = "tf_demo"
  }
}
# Remote state

Setup backend to store terraform state in Amazon S3
  1. Create bucket in AWS
        1. Create an S3 bucket (Note that bucket name is unique globally)
        2. Create folder called "mytf"

  2. Configure the bucket and path in backend.tf

           terraform {
             backend "s3" {
               bucket = "<YOUR BUCKET NAME>"
               key    = "mytf/terraform.tfstate"
               region = "ap-southeast-1"
             }
           }

       - Execute the following:  
        terraform init

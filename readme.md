Do exercises with increasing complexity:
1. Environment setup
   a. Download terraform

      https://www.terraform.io/downloads.html

   b. Setup backend to store terraform state in Amazon S3
       - Create bucket in AWS
         1. Create an S3 bucket (Note that bucket name is unique globally)
         2. Create folder called "mytf"
       - Configure the bucket and path in backend.tf

           terraform {
             backend "s3" {
               bucket = "<YOUR BUCKET NAME>"
               key    = "mytf/terraform.tfstate"
               region = "ap-southeast-1"
             }
           }

       - Execute the following:
        terraform init
        terraform workspace new dev


2. Create VPC and Internet Gateway

terraform init
terraform workspace select dev
terraform plan
terraform apply

3. Create the following AWS Resources:
   a. Public subnet
   b. Route Table
   c. Security Group
   d. EC2 instance inside public subnet


# Exercise 2

## AWS Resources
- S3
- EC2
- Key Pair
- Security Group

## Remote state
Setup backend to store terraform state (remember *.tfstate ?) in Amazon S3
  1. Create S3 bucket in AWS (if you have not done it earlier while setting up)
     1. Create an S3 bucket (Note that bucket name is unique globally worldwide)
     2. Create folder called "mytf"

  2. Configure the bucket and path in backend.tf

           terraform {
             backend "s3" {
               bucket = "<YOUR BUCKET NAME>"
               key    = "mytf/terraform.tfstate"
               region = "ap-southeast-1"
             }
           }

  3. Run: ```terraform init```
  4. Run: ```terraform apply```
     - tf_demo.pem will be created.
     - **Take note of your EC2 ip.**
  5. ssh to your EC2 instance
     1. ```chmod 400 tf_demo.pem```.
     2. ```ssh -i tf_demo.pem ubuntu@<EC2 PUBLIC IP>```

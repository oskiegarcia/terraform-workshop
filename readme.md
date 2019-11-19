# Course Outline

 
  Exercise | Description 
 --------------|-------------------------------------- 
 prac01-basic-ec2| EC2 basics, IAM
 prac02-keypair-securitygroup| Key Pair, Security Group
 prac03-vpc| VPC, Subnet, Route Table, Internet Gateway, NAT Gateway
 prac04-autoscaling| Launch Configuration, EC2 with user data, Auto Scaling Group, ALB
 prac05-modules| Terraform modules


# Initial setup

1. Environment setup
   1. IDE setup:
      - IntelliJ Community Edition (recommended)
        - Install Terraform Plugin
   2. Install AWS CLI 
      
        Platform  | URL
        ----------|------------
         Windows  | https://docs.aws.amazon.com/cli/latest/userguide/install-windows.html
         Mac      | https://docs.aws.amazon.com/cli/latest/userguide/install-macos.html
         Linux    |  https://docs.aws.amazon.com/cli/latest/userguide/install-linux.html 
     
2. Setup your AWS account (as Root)

   1. Set up multi-factor authentication
   2. New User Creation
      1. Setup new user
      2. create a group
      3. give admin permissions
      4. **Download access keys (credentials.csv)**
   3. Log out from root
   4. Sign in via the console link found in credentials.csv
      - Use your new IAM user credentials (Created in earlier step)
        - OPTIONAL: setup custom console login link
      - Configure a new profile 
        ```
        aws configure --profile tf_demo
        ```
      - When asked for access keys, use info from credential.csv
      - Verify the profile is setup correctly with:
        1. ```cd ~/.aws```
        2. ```cat credentials```
      - Test that profile works:
        1. ```aws s3 ls --profile tf_demo```.
           - You should NOT see an error but there will be NO S3 bucket info listed.
   5. Go to your AWS console as the created new user (log in from the web).
      1. Create a new S3 bucket from the AWS console.
         - Select NEXT all the way.
         - **Give a name you can remember for your s3 bucket as you will use it in prac02**
      2. Retry ```aws s3 ls --profile tf_demo``` again.
         - You should see your bucket listed there.

3. Download terraform
   - https://www.terraform.io/downloads.html
   - Mac or Linux:
     1. unzip terrform.
     2. ```sudo cp terraform /usr/local/bin```
     3. Verify terraform installation by:
       ```terrafrom -v```

4. If you are pushing to Github, put the following entries in .gitignore file
   
      ```shell script
           .idea/
           */.terraform/*
           */terraform.tfstate
           */terraform.tfstate.backup
      ```

5. Useful links

   Name      | URL
   ----------|------------
   EC2 locator| https://cloud-images.ubuntu.com/locator/ec2/ 
   List of Providers| https://www.terraform.io/docs/providers/index.html
   AWS Provider|https://www.terraform.io/docs/providers/aws/index.html
   EC2 Metadata|https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html
  
6. Terraform commands

   Command   | Description
   ----------|------------
   version| Prints the Terraform version
   init| Initialize a Terraform working directory
   plan| Generate ans show execution plan
   apply| Builds or changes infrastructure
   destroy| Destroy Terraform-managed infrastructure
   show| Inspect Terraform state or plan
   output| Read an output from a state file
   refresh| Update local state file against real resources
   console| Interactive console for Terraform interpolations
   
 7. Terraform syntax
 
 The general syntax for a Terraform resource is:
 
 ```hcl-terraform
resource "<PROVIDER>_<TYPE>" "<NAME>" {
 [CONFIG …]
}
```
    
      

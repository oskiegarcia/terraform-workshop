# Course Outline

 
  Exercise | Description 
 --------------|-------------------------------------- 
 prac01-basic-ec2| EC2 basics, IAM
 prac02-keypair-securitygroup| Key Pair, Security Group
 prac03-vpc| VPC, Subnet, Route Table, Internet Gateway, NAT Gateway
 prac04-autoscaling| Launch Configuration, EC2 with user data, Auto Scaling Group, ELB
 prac05-modules| Terraform modules


# Initial setup

1. Environment setup  
   a. Setup your AWS account
  
     - Create user with Admin privileges
     - Create your ACCESS KEY

   b. Download terraform

      https://www.terraform.io/downloads.html

   c. Install AWS CLI 
   
     Platform  | URL
     ----------|------------
      Windows  | https://docs.aws.amazon.com/cli/latest/userguide/install-windows.html
      Mac      | https://docs.aws.amazon.com/cli/latest/userguide/install-macos.html
      Linux    |  https://docs.aws.amazon.com/cli/latest/userguide/install-linux.html 
           

   d. Run AWS configure command to store access key

     ```shell script
     aws configure --profile tf_demo
     ```

   f. If you are pushing to Github, put the following entries in .gitignore file
   
   ```shell script
       .idea/
       */.terraform/*
       */terraform.tfstate
       */terraform.tfstate.backup
   ```

2. Useful links

   Name      | URL
   ----------|------------
   EC2 locator| https://cloud-images.ubuntu.com/locator/ec2/ 
   List of Providers| https://www.terraform.io/docs/providers/index.html
   AWS Provider|https://www.terraform.io/docs/providers/aws/index.html
      
3. Terraform commands

   Command      | Description
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
   
 4. Terraform syntax
 
 The general syntax for a Terraform resource is:
 
 ```hcl-terraform
resource "<PROVIDER>_<TYPE>" "<NAME>" {
 [CONFIG …]
}
```
    
      

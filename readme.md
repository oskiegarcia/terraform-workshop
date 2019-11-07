

1. Environment setup
   a. Setup your AWS account
  
     - Create user with Admin privileges
     - Create your ACCESS KEY

   b. Download terraforme

      https://www.terraform.io/downloads.html

   c. Install AWS CLI 
   
      Windows:
        https://docs.aws.amazon.com/cli/latest/userguide/install-windows.html
        
      Mac:
        https://docs.aws.amazon.com/cli/latest/userguide/install-macos.html  
       
      Linux:
        https://docs.aws.amazon.com/cli/latest/userguide/install-linux.html  

   d. Run AWS configure command to store access key

     aws configure

   f. If you are pushing to Github, put the following entries in .gitignore file
   
       .idea/
       */.terraform/*
       */terraform.tfstate
       */terraform.tfstate.backup

2. Useful links

   a. EC2 locator 
      https://cloud-images.ubuntu.com/locator/ec2/



# Exercise 1

## AWS Resources
- IAM User
- EC2


## Steps
1. ```cd ./prac01*```
2. ```terraform init```
	-  installs all required plugins. Found from *.tf files when you name the resouce. eg. resource "aws_..."
3. **[OPTIONAL STEP]** ```terraform plan```
   - Display resources that will be created/destroyed/ modified based of the *.tf file in the dir
4. ```terraform apply```.
   - A file called "terraform.tfstate" will be created in your dir. Shows the resource configuration.
5. Verification step: Go back to your aws console
	- go to EC2
	- go to Instances -> country (top right drop down) -> singapore
	- You should see the EC2 instance listed.
6. Destroy the EC2 instance (or it will be expensive!)
   ```
   terraform destroy
   ```

## Notes:
- Terraform keeps the remote state of the infrastructure
- It stores it in a file called terraform.tfstate
- Previous state is stored in terraform.tfstate.backup
- When you execute terraform apply, a new terraform.tfstate and backup is written
- How terraform keeps track of the tf state file
  *  If the underlying resource changes outside of terraform and you hit terraform apply again, terraform will make changes to meet
     the tf state file
  * e.g. you terminate an instance that is managed by terraform, after terraform apply, instance will be 
    created again
       
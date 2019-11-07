
- Terraform keeps the remote state of the infrastructure
- It stores it in a file called terraform.tfstate
- Previous state is stored in terraform.tfstate.backup
- When you execute terraform apply, a new terraform.tfstate and backup is written
- How terraform keeps track of the tf state file
  *  If the underlying resource changes outside of terraform and you hit terraform apply again, terraform will make changes to meet
     the tf state file
  * e.g. you terminate an instance that is managed by terraform, after terraform apply, it will be 
    create again
       
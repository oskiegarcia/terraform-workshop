
module "tf_demo_vpc" {
  source = "./modules/vpc"
  name = "tf-demo-aws-vpc"
  owner = var.owner
  environment = var.environment
  vpc_cidr = "10.0.0.0/16"
}

module "az_a_public_sub" {
  source = "./modules/vpc/public_subnet"
  name = "tf-demo-public-subnet-az-a"
  owner = var.owner
  environment = var.environment

  az = "${var.aws_region}a"
  igw_id = module.tf_demo_vpc.igw_id
  subnet_cidr_block = "10.0.0.0/24"
  vpc_id = module.tf_demo_vpc.vpc_id
}

module "az_b_public_sub" {
  source = "./modules/vpc/public_subnet"
  name = "tf-demo-public-subnet-az-b"
  owner = var.owner
  environment = var.environment

  az = "${var.aws_region}b"
  igw_id = module.tf_demo_vpc.igw_id
  subnet_cidr_block = "10.0.2.0/24"
  vpc_id = module.tf_demo_vpc.vpc_id
}


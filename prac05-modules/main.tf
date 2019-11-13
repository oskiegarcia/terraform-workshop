# Specify the provider and access details
provider "aws" {
  region = var.aws_region
  profile = var.account_profile
}

module "tf_demo_vpc" {
  source = "./modules/vpc"
  name = "tf-demo-aws-vpc"
  vpc_cidr = "10.0.0.0/16"
  owner = var.owner
  environment = var.environment
}

module "az_a_public_sub" {
  source = "./modules/vpc/public_subnet"
  name = "tf-demo-public-subnet-az-a"
  subnet_cidr_block = "10.0.0.0/24"
  owner = var.owner
  environment = var.environment
  az = "${var.aws_region}a"
  igw_id = module.tf_demo_vpc.igw_id
  vpc_id = module.tf_demo_vpc.vpc_id
}

module "az_b_public_sub" {
  source = "./modules/vpc/public_subnet"
  name = "tf-demo-public-subnet-az-b"
  subnet_cidr_block = "10.0.2.0/24"
  owner = var.owner
  environment = var.environment
  az = "${var.aws_region}b"
  igw_id = module.tf_demo_vpc.igw_id
  vpc_id = module.tf_demo_vpc.vpc_id
}

module "allow_ssh" {
  source = "./modules/sg"
  name = "tf-demo-allow-ssh-sg"
  environment = var.environment
  owner = var.owner
  vpc_id = module.tf_demo_vpc.vpc_id
  inbound_cidr = [var.everywhere_cidr]
  inbound_desc = "ssh login"
  inbound_port_from = 22
  inbound_port_to = 22
}

module "allow_http80" {
  source = "./modules/sg"
  name = "tf-demo-allow-http80-sg"
  environment = var.environment
  owner = var.owner
  vpc_id = module.tf_demo_vpc.vpc_id
  inbound_cidr = [var.everywhere_cidr]
  inbound_desc = "http access"
  inbound_port_from = 80
  inbound_port_to = 80
}

module "key_pair" {
  source = "./modules/ec2/key_pair"
  key_name = "tf_demo_key"
  key_filename = "tf_demo.pem"
}

module "tf_demo_alb" {
  source = "./modules/alb"
  lb_name = "tf-demo-alb"
  tg_name = "tf-demo-alb-tg"
  owner = var.owner
  environment = var.environment
  vpc_id = module.tf_demo_vpc.vpc_id
  subnets =  [module.az_a_public_sub.id, module.az_b_public_sub.id]
  security_groups = [module.allow_http80.id]
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
  owners = ["099720109477"]
}

module "tf_demo_asg" {
  source = "./modules/asg"
  asg_name = "tf-demo-asg"
  instance_type = "t2.micro"
  min_size = "2"
  max_size = "2"
  user_data_filename = "install_softwares.sh"
  alb_target_group_arn = module.tf_demo_alb.tg_arn
  image_id = data.aws_ami.ubuntu.id
  key_name = module.key_pair.key_name
  security_groups =  [module.allow_ssh.id, module.allow_http80.id]
  vpc_zone_identifier =  [module.az_a_public_sub.id,module.az_b_public_sub.id]
}


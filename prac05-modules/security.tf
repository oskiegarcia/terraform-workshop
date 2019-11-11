
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



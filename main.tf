module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name            = "vpc-${terraform.workspace}"
  cidr            = var.cidr_map[terraform.workspace]
  azs             = var.azs
  public_subnets  = var.public_subnets_map[terraform.workspace]
  private_subnets = var.private_subnets_map[terraform.workspace]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Name        = "vpc-${terraform.workspace}"
    Environment = terraform.workspace
    Project     = "desafio-terraform"
  }
}

module "ec2" {
  source = "./modules/ec2"

  private_subnets = module.vpc.private_subnets
  ami             = "ami-0c55b159cbfafe1f0" 
  instance_type   = "t2.micro"
  environment     = terraform.workspace
  tags = {
    Environment = terraform.workspace
    Project     = "desafio-terraform"
    Iac         = true
  }
}

module "lb" {
  source = "./modules/lb"

  vpc_id           = module.vpc.vpc_id
  public_subnets   = module.vpc.public_subnets
  target_instances = module.ec2.instance_ids

  tags = {
    Project     = "desafio-terraform"
    Environment = terraform.workspace
  }
}

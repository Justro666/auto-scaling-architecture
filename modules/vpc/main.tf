module "vpc" {
  source                 = "terraform-aws-modules/vpc/aws"
  version                = "5.13.0"
  default_vpc_name       = var.vpc_name
  azs                    = var.azs
  cidr                   = var.vpc_cidr
  public_subnets         = var.public_subnet_cidrs
  private_subnets        = var.private_subnet_cidrs
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  tags = {
    Terraform = true
  }
}

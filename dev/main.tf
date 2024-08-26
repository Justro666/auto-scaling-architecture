locals {
  vpc_name = "${var.environment}-${var.vpc_name}"
}

module "vpc" {
  source               = "../modules/vpc"
  vpc_name             = local.vpc_name
  azs                  = var.azs
  vpc_cidr             = var.vpc_cidr
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs  = var.public_subnet_cidrs
}

module "security_groups" {
  source               = "../modules/security_group"
  vpc_id               = module.vpc.vpc_id
  app_sg_name          = var.app_sg_name
  alb_sg_name          = var.alb_sg_name
  bastian_host_sg_name = var.bastian_host_sg_name
}

module "launch_template" {
  source               = "../modules/launch_template"
  launch_template_name = var.launch_template_name
  ami_id               = var.ami_id
  instance_type        = var.launch_instance_type
  keypair_name         = var.keypair_name
  app_sg_id            = module.security_groups.app_sg_id
  user_data            = base64encode(file("./scripts/user-data.bash"))
}

module "target_group" {
  source            = "../modules/target_groups"
  target_group_name = var.target_group_name
  vpc_id            = module.vpc.vpc_id
}

module "load_balancer" {
  source           = "../modules/load_balancer"
  vpc_id           = module.vpc.vpc_id
  alb_name         = var.alb_name
  lb_sg_id         = module.security_groups.alb_sg_id
  subnet_ids       = module.vpc.private_subnet_ids
  alb_tg_name      = var.alb_tg_name
  target_group_arn = module.target_group.target_group_arn
}

module "auto_scaling_group" {
  source                        = "../modules/auto_scaling"
  auto_scaling_group_name       = var.auto_scaling_group_name
  auto_scaling_max_size         = var.auto_scaling_max_size
  auto_scaling_min_size         = var.auto_scaling_min_size
  auto_scaling_desired_capacity = var.auto_scaling_desired_capacity
  vpc_zone_identifier           = module.vpc.private_subnet_ids
  launch_template_id            = module.launch_template.launch_template_id
  load_balancer_name            = module.load_balancer.load_balancer_name
  target_group_arn              = module.target_group.target_group_arn
}

module "compute" {
  source             = "../modules/compute"
  bastian_host_sg_id = module.security_groups.bastian_host_sg_id
  public_subnet_id   = module.vpc.public_subnet_ids[0]
  instance_type      = var.bastian_host_instance_type
  keypair_name       = var.keypair_name
}

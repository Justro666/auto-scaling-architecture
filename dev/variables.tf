variable "aws_region" {
  description = "AWS region to deploy resources into"
  type        = string
  default     = "ap-southeast-2"
}

variable "environment" {
  description = "Environment variable for configuration"
  type        = string
  default     = "dev"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "demo-asg-vpc"
}

variable "azs" {
  description = "avality zones to use in AWS"
  type        = list(string)
  default     = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default = [
    "10.0.0.0/19",
    "10.0.32.0/19",
    "10.0.64.0/19"
  ]
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default = [
    "10.0.128.0/20",
    "10.0.144.0/20",
    "10.0.160.0/20"
  ]
}

variable "app_sg_name" {
  description = "Name of the Application Security Group"
  type        = string
}

variable "alb_sg_name" {
  description = "Name of the App Load Balancer Security Group"
  type        = string
}

variable "bastian_host_sg_name" {
  description = "Name of the App Load Balancer Security Group"
  type        = string
}

variable "launch_template_name" {
  description = "Name to the Launch Template"
  type        = string
}

variable "ami_id" {
  description = "Id Of the ami from aws"
  type        = string
}

variable "launch_instance_type" {
  description = "Type of the Instance for launch template"
  type        = string
  default     = "t2.micro"
}

variable "keypair_name" {
  description = "Key Pair from aws for launch template"
  type        = string
}

variable "target_group_name" {
  description = "Name of the target group"
  type        = string
  default     = "Alb Target Group"
}

variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "alb_tg_name" {
  description = "Name of the Application Load Balancer Target Group"
  type        = string
}

variable "auto_scaling_group_name" {
  type        = string
  description = "Name of the Auto Scaing Group"
}

variable "auto_scaling_max_size" {
  type        = number
  description = "Scaling Group Max Size"
}


variable "auto_scaling_min_size" {
  type        = number
  description = "Scaling Group Max Size"
}

variable "auto_scaling_desired_capacity" {
  type        = number
  description = "Scaling Group desired capacity"
}

variable "load_balancer_name" {
  type        = string
  description = "Name of the LB"
}

variable "bastian_host_instance_type" {
  description = "Instance type of Ec2 for bastian host"
  type        = string
  default     = "t2.nano"
}

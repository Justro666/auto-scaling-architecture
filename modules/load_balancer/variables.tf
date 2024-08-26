variable "vpc_id" {
  description = "Id of the VPC"
  type        = string
}

variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "lb_sg_id" {
  description = "Id of the Application SG"
  type        = string
}

variable "subnet_ids" {
  description = "List of the Subnet Ids of vpc"
  type        = set(string)
}

variable "alb_tg_name" {
  description = "Name of the Application Load Balancer Target Group"
  type        = string
}

variable "target_group_arn" {
  description = "Target Group of the ARN"
  type        = string
}

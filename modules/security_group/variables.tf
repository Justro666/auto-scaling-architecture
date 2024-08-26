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

variable "vpc_id" {
  description = "Id of the VPC"
  type        = string
}

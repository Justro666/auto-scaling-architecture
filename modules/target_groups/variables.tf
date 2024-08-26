variable "vpc_id" {
  description = "Id of the VPC"
  type        = string
}

variable "target_group_name" {
  description = "Name of the target group"
  type        = string
  default     = "Alb Target Group"
}

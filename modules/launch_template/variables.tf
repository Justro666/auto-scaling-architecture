variable "launch_template_name" {
  description = "Name to the Launch Template"
  type        = string
}

variable "ami_id" {
  description = "Id Of the ami from aws"
  type        = string
}

variable "instance_type" {
  description = "Type of the Instance for launch template"
  type        = string
  default     = "t2.micro"
}

variable "keypair_name" {
  description = "Key Pair from aws for launch template"
  type        = string
}

variable "app_sg_id" {
  description = "SG Id of App Sg for launch template"
  type        = string
}

variable "user_data" {
  description = "User Data for Laucnh Template"
}

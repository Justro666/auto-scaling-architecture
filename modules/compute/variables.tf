variable "instance_type" {
  description = "Instance type of Ec2"
  type        = string
}

variable "keypair_name" {
  description = "Aws Key Pair Name"
  type        = string
}

variable "public_subnet_id" {
  description = "VPC Subnet Id"
}

variable "bastian_host_sg_id" {
  description = "Public Security Group Id"
  type        = string
}

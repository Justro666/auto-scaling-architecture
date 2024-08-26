output "vpc_id" {
  description = "Id of the VPC"
  value       = module.vpc.vpc_id
}
output "public_subnet_ids" {
  description = "Id list of the Public Subnets"
  value       = module.vpc.public_subnets
}
output "private_subnet_ids" {
  description = "Ids of the private Subnets"
  value       = module.vpc.private_subnets
}

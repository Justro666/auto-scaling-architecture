output "app_sg_id" {
  description = "Id of the application security gp"
  value       = aws_security_group.application_sg.id
}

output "alb_sg_id" {
  description = "Id of the application LB security gp"
  value       = aws_security_group.alb_sg.id
}

output "bastian_host_sg_id" {
  description = "Id of the Bastian Host security gp"
  value       = aws_security_group.bastian_host.id
}

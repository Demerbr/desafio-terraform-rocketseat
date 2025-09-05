output "private_ec2_ids" {
  description = "IDs das instâncias privadas"
  value       = aws_instance.private_ec2[*].id
}

output "private_ec2_private_ips" {
  description = "IPs privados das instâncias"
  value       = aws_instance.private_ec2[*].private_ip
}

output "instance_ids" {
  value       = aws_instance.private_ec2[*].id
  description = "IDs das instâncias EC2 privadas"
}

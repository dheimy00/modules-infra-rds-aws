output "rds_instance_id" {
  description = "The ID of the RDS instance"
  value       = aws_db_instance.rds.id
}

output "rds_instance_endpoint" {
  description = "The connection endpoint"
  value       = aws_db_instance.rds.endpoint
}

output "rds_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.rds.arn
}

output "rds_instance_port" {
  description = "The database port"
  value       = aws_db_instance.rds.port
}

output "rds_instance_username" {
  description = "The master username for the database"
  value       = aws_db_instance.rds.username
}

output "rds_instance_db_name" {
  description = "The name of the database"
  value       = aws_db_instance.rds.db_name
}

output "rds_security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.rds.id
}

output "rds_subnet_group_id" {
  description = "The ID of the subnet group"
  value       = aws_db_subnet_group.rds.id
} 
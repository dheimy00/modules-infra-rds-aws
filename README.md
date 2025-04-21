# Terraform AWS RDS Module

This Terraform module creates an RDS instance (MySQL or PostgreSQL) in AWS with configurable parameters.

## Features

- Supports both MySQL and PostgreSQL engines
- Configurable instance type and storage
- VPC-based deployment with security groups
- Automated backups
- Multi-AZ support
- Encryption support
- Customizable maintenance windows
- Tagging support

## Usage

```hcl
module "rds" {
  source = "path/to/module"

  # Required variables
  identifier           = "my-rds-instance"
  engine              = "mysql" # or "postgres"
  engine_version      = "8.0.33"
  instance_class      = "db.t3.micro"
  allocated_storage   = 20
  username            = "admin"
  password            = "your-secure-password"
  vpc_id              = "vpc-12345678"
  subnet_ids          = ["subnet-12345678", "subnet-87654321"]
  db_subnet_group_name = "my-db-subnet-group"
  security_group_name  = "my-rds-sg"

  # Optional variables
  db_name                = "mydatabase"
  db_port                = 3306
  backup_retention_period = 7
  multi_az               = false
  publicly_accessible    = false
  storage_encrypted      = true
  tags = {
    Environment = "production"
    Terraform   = "true"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| identifier | The name of the RDS instance | string | - | yes |
| engine | The database engine to use (mysql or postgres) | string | "mysql" | no |
| engine_version | The engine version to use | string | "8.0.33" | no |
| instance_class | The instance type of the RDS instance | string | "db.t3.micro" | no |
| allocated_storage | The allocated storage in gigabytes | number | 20 | no |
| storage_type | One of 'standard', 'gp2', or 'io1' | string | "gp2" | no |
| storage_encrypted | Specifies whether the DB instance is encrypted | bool | true | no |
| kms_key_id | The ARN for the KMS encryption key | string | null | no |
| db_name | The DB name to create | string | null | no |
| username | Username for the master DB user | string | - | yes |
| password | Password for the master DB user | string | - | yes |
| db_port | The port on which the DB accepts connections | number | 3306 | no |
| vpc_id | VPC ID to create the RDS instance in | string | - | yes |
| subnet_ids | List of subnet IDs to create the RDS instance in | list(string) | - | yes |
| db_subnet_group_name | Name of DB subnet group | string | - | yes |
| security_group_name | Name of the security group to create | string | - | yes |
| allowed_security_groups | List of security group IDs to allow access | list(string) | [] | no |
| allowed_cidr_blocks | List of CIDR blocks to allow access | list(string) | [] | no |
| backup_retention_period | The days to retain backups for | number | 7 | no |
| backup_window | The daily time range for automated backups | string | "03:00-04:00" | no |
| maintenance_window | The window to perform maintenance in | string | "Mon:04:00-Mon:05:00" | no |
| multi_az | Specifies if the RDS instance is multi-AZ | bool | false | no |
| publicly_accessible | Bool to control if instance is publicly accessible | bool | false | no |
| skip_final_snapshot | Determines whether a final DB snapshot is created | bool | false | no |
| final_snapshot_identifier | The name of your final DB snapshot | string | null | no |
| tags | A map of tags to add to all resources | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| rds_instance_id | The ID of the RDS instance |
| rds_instance_endpoint | The connection endpoint |
| rds_instance_arn | The ARN of the RDS instance |
| rds_instance_port | The database port |
| rds_instance_username | The master username for the database |
| rds_instance_db_name | The name of the database |
| rds_security_group_id | The ID of the security group |
| rds_subnet_group_id | The ID of the subnet group |

## Requirements

- Terraform >= 1.0.0
- AWS Provider >= 4.0.0

## Security Considerations

- Always use strong passwords
- Enable encryption for sensitive data
- Restrict access using security groups
- Consider using AWS Secrets Manager for credentials
- Enable multi-AZ for production workloads
- Regular backups should be configured 
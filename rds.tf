resource "aws_db_instance" "mytestdb-1" {
engine         = "mysql"
engine_version = "8.0.28"
instance_class = "db.t4g.small"
db_name           = "mytestdb3"
username = "root"
password = "27351360"
allocated_storage = 10
availability_zone = "eu-central-1a"
skip_final_snapshot = true
backup_retention_period = 1
maintenance_window      = "Mon:06:00-Mon:09:00"
backup_window = "09:01-11:00"
apply_immediately = true
}
resource "aws_db_parameter_group" "default" {
  name        = "sepehr"
  description = "Tests"
  family      = "mysql8.0"
  parameter {
    name  = "max_connections"
    value = "250"
  }
  
}

provider "aws" {
  access_key = "AKIAXVYFFBDEJAD5T2GW"
  secret_key = "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"
  region     = "eu-central-1"
}


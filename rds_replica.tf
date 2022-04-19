resource "aws_db_instance" "replica" {
  replicate_source_db  = "arn:aws:rds:eu-central-1:527754922184:db:terraform-20220413091336825700000001"
  instance_class       = "db.t3.small"
  apply_immediately    = true
  publicly_accessible  = false
  multi_az = false
  skip_final_snapshot  = true
   vpc_security_group_ids = [
    "sg-0fcb6afd409eab2ad"
  ]
  lifecycle {
    prevent_destroy = true
    create_before_destroy = true
  }
}
resource "aws_db_parameter_group" "default" {
  name        = "sepehr_replica"
  description = "Tests"
  family      = "mysql8.0"
  parameter {
    name  = "max_connections"
    value = "250"
     }
  parameter {
    name  = "replicate-do-db"
    value = "test_replica"
     }

}
provider "aws" {
  access_key = "AKIAXVYFFBDEJAD5T2GW"
  secret_key = "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"
  region     = "eu-central-1"
}

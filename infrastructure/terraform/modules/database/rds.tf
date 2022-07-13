# Subnetgroup
resource "aws_db_subnet_group" "rds-subnet-group" {
  name        = var.rds_subnet_group_name
  description = "Subnets to launch RDS database into"
  subnet_ids  = var.database_subnet_ids
}

# The cluster
resource "aws_rds_cluster" "rds-cluster" {
  engine                 = "aurora-postgresql"
  database_name          = "JIRA"
  master_username        = "root"
  master_password        = var.database_master_password
  storage_encrypted      = true
  db_subnet_group_name   = aws_db_subnet_group.rds-subnet-group.name
  vpc_security_group_ids = [aws_security_group.security-group-rds.id]
  skip_final_snapshot    = true

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
  }
}

# THe actual instance
resource "aws_rds_cluster_instance" "rds-cluster-instance" {
  cluster_identifier         = aws_rds_cluster.rds-cluster.id
  identifier                 = var.rds_instance_name
  engine                     = "aurora-postgresql"
  instance_class             = var.rds_instance_type
  publicly_accessible        = false
  db_subnet_group_name       = aws_db_subnet_group.rds-subnet-group.name
  auto_minor_version_upgrade = true

  lifecycle {
    create_before_destroy = true
  }
}

# TODO: replication between AZs!
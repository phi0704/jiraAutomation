# Allow traffic on port 3306 from RDSCluster
resource "aws_security_group" "security-group-rds" {
  name = var.rds_security_group_name
  description = "RDS access from internal security groups"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow 3306 from defined security groups"
    protocol    = "tcp"
    from_port   = 3306
    to_port     = 3306

    security_groups = [
      var.security_group_ec2_id
    ]
  }
}

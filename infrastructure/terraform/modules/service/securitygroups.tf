# Traffic to the ECS cluster should only come from the ALB
resource "aws_security_group" "security_group_ec2" {
  name        = var.ec2_security_group_name
  description = "allow inbound access from the ALB only"
  vpc_id      = var.vpc_id

  ingress {
    protocol        = "tcp"
    from_port       = 0 #TODO:
    to_port         = 0 #TODO:
    security_groups = [var.security_group_loadbalancer_id]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
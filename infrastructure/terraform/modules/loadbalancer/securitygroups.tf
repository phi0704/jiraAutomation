# ALB Security Group: TODO: Edit to restrict access to the application
resource "aws_security_group" "security_group_loadbalancer" {
  name        = var.lb_security_group_name
  description = "controls access to the ALB"
  vpc_id      = var.vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = 0 # TODO:
    to_port     = 0 # TODO:
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
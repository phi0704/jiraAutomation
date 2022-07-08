# The actual loadbalancer
resource "aws_lb" "loadbalancer" {
  name            = var.loadbalancer_name
  subnets         = var.public_subnets
  security_groups = [aws_security_group.security_group_loadbalancer.id]
}

# Targetgroup
resource "aws_alb_target_group" "targetgroup" {
  name        = var.targetgroup_name
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"
  port = 3000

  health_check {
    healthy_threshold   = "3"
    interval            = "30"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "3"
    path                = var.health_check_path
    unhealthy_threshold = "2"
  }
}

# Redirect all traffic from the ALB to the target group
resource "aws_alb_listener" "front_end" {
  load_balancer_arn = aws_lb.loadbalancer.id
  port = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.targetgroup.id
    type             = "forward"
  }
}

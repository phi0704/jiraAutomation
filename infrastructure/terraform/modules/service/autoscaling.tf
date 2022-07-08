# Autoscaling group
resource "aws_autoscaling_group" "autoscaling_group" {
  availability_zones   = var.availability_zones
  name                 = var.auto_scalinggroup_name
  launch_configuration = aws_launch_configuration.launch_configuration.name
  min_size             = 1
  max_size             = 3

  lifecycle {
    create_before_destroy = true
  }
}

# Automatically scale capacity down by one
resource "aws_autoscaling_policy" "scaling_policy_down" {
  autoscaling_group_name  = aws_autoscaling_group.autoscaling_group.name
  name                    = var.scaling_down_policy_name
  adjustment_type         = "ChangeInCapacity"
  policy_type             = "StepScaling"
  metric_aggregation_type = "Maximum"

  step_adjustment {
    metric_interval_upper_bound = 0
    scaling_adjustment          = -1
  }
}

# Automatically scale capacity up by one
resource "aws_autoscaling_policy" "scaling_policy_up" {
  autoscaling_group_name  = aws_autoscaling_group.autoscaling_group.name
  name                    = var.scaling_up_policy_name
  adjustment_type         = "ChangeInCapacity"
  policy_type             = "StepScaling"
  metric_aggregation_type = "Maximum"

  step_adjustment {
    metric_interval_upper_bound = 0
    scaling_adjustment          = 1
  }
}

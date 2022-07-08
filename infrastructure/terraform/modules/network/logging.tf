resource "aws_cloudwatch_log_group" "vpc-loggroup" {
  name              = var.vpc_loggroup_name
  retention_in_days = 30
}

# Logging all flows to targetgroup
resource "aws_flow_log" "vpc-flow-log" {
  iam_role_arn    = aws_iam_role.vpc_flow_log_role.arn
  log_destination = aws_cloudwatch_log_group.vpc-loggroup.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.vpc.id
}

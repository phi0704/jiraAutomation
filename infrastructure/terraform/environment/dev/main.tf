module "database" {
  source                  = "./../../modules/database"
  database_subnet_ids     = module.network.private_subnets
  rds_instance_name       = lower(format(local.naming-pattern-hyphen, "rds-instance"))
  rds_instance_type       = var.rds_instance_type
  rds_subnet_group_name   = lower(format(local.naming-pattern-hyphen, "subnetgroup"))
  rds_security_group_name = format(local.naming-pattern-hyphen, "rds-security-group")
  security_group_ec2_id   = module.service.ec2_security_group_id
  vpc_id                  = module.network.vpc_id
}

module "loadbalancer" {
  source                 = "./../../modules/loadbalancer"
  lb_security_group_name = format(local.naming-pattern-hyphen, "lb-security-group")
  loadbalancer_name      = format(local.naming-pattern-hyphen, "loadbalancer")
  public_subnets         = module.network.public_subnets
  targetgroup_name       = format(local.naming-pattern-hyphen, "targetgroup")
  vpc_id                 = module.network.vpc_id
}

module "network" {
  source                   = "./../../modules/network"
  availability_zones       = var.availability_zones
  vpc_flow_log_policy_name = format(local.naming-pattern-hyphen, "flow-log-policy")
  vpc_flow_log_role_name   = format(local.naming-pattern-hyphen, "flow-log-role")
  vpc_loggroup_name        = format(local.naming-pattern-hyphen, "flow-log-loggroup")
}

module "service" {
  source                         = "./../../modules/service"
  alarm_name                     = format(local.naming-pattern-hyphen, "alarm")
  auto_scalinggroup_name         = format(local.naming-pattern-hyphen, "scalinggroup")
  availability_zones             = var.availability_zones
  image_id                       = var.image_id
  instance_type                  = var.instance_type
  launch_configuration_name      = format(local.naming-pattern-hyphen, "launchconfiguration")
  scaling_down_policy_name       = format(local.naming-pattern-hyphen, "scaling-down-policy")
  scaling_up_policy_name         = format(local.naming-pattern-hyphen, "scaling-up-policy")
  ec2_security_group_name        = format(local.naming-pattern-hyphen, "ec2-security-group")
  security_group_loadbalancer_id = module.loadbalancer.security_group_loadbalancer_id
  vpc_id                         = module.network.vpc_id
}

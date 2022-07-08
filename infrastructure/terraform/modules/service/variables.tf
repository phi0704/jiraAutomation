variable "alarm_name" {
  description = "pattern for the alarm name"
  type = string
}

variable "auto_scalinggroup_name" {
  description = "pattern for the autoscalinggroup name"
  type = string
}

variable "availability_zones" {
  description = "availability zones in use"
  type = list(string)
}

variable "ec2_security_group_name" {
  description = "pattern for the name of the ec2 securitygroup"
  type = string
}

variable "instance_type" {
  description = "vm machine specs determined by instance type"
  type = string
}

variable "image_id" {
  description = "which AMI to use"
  type = string
}

variable "launch_configuration_name" {
  description = "pattern for the launch config name"
  type = string
}

variable "min_scaling_count_service" {
  default = 1
  description = "min count of services"
  type = number
}

variable "max_scaling_count_service" {
  default = 4
  description = "max count of services"
  type = number
}

variable "scaling_down_policy_name" {
  description = "name of the scaling down policy"
  type = string
}

variable "scaling_up_policy_name" {
  description = "name of the scaling up policy"
  type = string
}

variable "security_group_loadbalancer_id" {
  description = "id aatribute of the vpc from module loadbalancer"
}

variable "vpc_id" {
  description = "id attribute of the vpc from module network"
  type = string
}

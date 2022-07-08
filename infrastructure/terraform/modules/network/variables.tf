variable "availability_zones" {
  description = "list of az to be used"
  type        = list(string)
}

variable "cidr_block" {
  default = "10.0.0.0/16"
  description = "CIDR block for VPC"
  type = string
}

variable "vpc_flow_log_policy_name" {
  type        = string
  description = "name of the vpcflowlog policy"
}

variable "vpc_flow_log_role_name" {
  type        = string
  description = "name of the vpc flowlogrole"
}

variable "vpc_loggroup_name" {
  type        = string
  description = "name of the vpc loggroup"
}
variable "health_check_path" {
  default     = "/"
  description = "path to check whether service is healthy"
  type        = string
}

variable "lb_security_group_name" {
  description = "pattern for the name of the loadbalancer securitygroup"
  type        = string
}

variable "loadbalancer_name" {
  description = "pattern for the name of the loadbalancer"
  type        = string
}

variable "public_subnets" {
  description = "list of public subnet ids from network module"
  type        = list(string)
}

variable "targetgroup_name" {
  description = "pattern for the name of the targetgroup"
  type        = string
}

variable "vpc_id" {
  description = "id attribute of the vpc from module network"
  type        = string
}
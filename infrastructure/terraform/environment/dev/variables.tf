# general variables
variable "environment" {
  default     = "dev"
  description = "environment"
  type        = string
}

variable "projectName" {
  default     = "plRampUp"
  description = "Name of the project, used mainly for tagging"
  type        = string
}

variable "region" {
  description = "(optional) describe your variable"
  type        = string
}

# network variables
variable "availability_zones" {
  description = "list of az to be used"
  type        = list(string)
}

# service variables
variable "image_id" {
  description = "which AMI to use"
  type = string
}

variable "instance_type" {
  description = "vm machine specs determined by instance type"
  type = string
}

# database variables
variable "rds_instance_type" {
  type = string
  description = "what database size is used for rds"
}

locals {
  naming-pattern-underscore  = "${var.projectName}_%s_${var.environment}"
  naming-pattern-noundescore = "${var.projectName}%s${var.environment}"
  naming-pattern-hyphen      = "${var.projectName}-%s-${var.environment}"
}

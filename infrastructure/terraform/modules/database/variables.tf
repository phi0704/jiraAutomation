variable "database_master_password" {
  description = "The master pw for the database"
  default = "adminrdspl" #TODO: no default! -> .tfvars
  type = string
}
variable "database_subnet_ids" {
  description = "The (private) subnets RDS is going to live in"
  type = list(string)
}

variable "rds_instance_name" {
  description = "Name of the rda instance"
  type = string
}

variable "rds_instance_type" {
  description = "AWS spec identifier for db instance"
  type = string
}

variable "rds_security_group_name"{
  description = "pattern for the rds securitygroup name"
  type = string
}

variable "rds_subnet_group_name" {
  description = "pattern for the subnetgroup name"
  type = string
}

variable "security_group_ec2_id" {
  description = "the security group of ec2 which will be allowed to access the db"
  type = string
}


variable "vpc_id" {
  description = "the vpc id to host the db"
  type = string
}
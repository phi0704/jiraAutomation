terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = "default"
  default_tags {
    tags = {
      project = var.projectName
      environment = var.environment
    }
  }
}

terraform {
  backend "s3" {
    bucket = "remoteterraformstates"
    region = "eu-central-1"
    key    = "plRampUp/environments/dev/terraform.tfstate"
  }
}

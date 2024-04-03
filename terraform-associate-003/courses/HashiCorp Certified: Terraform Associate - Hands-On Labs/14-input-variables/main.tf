terraform {
  required_version = ">=1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0, < 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  # credentials will be retrieved from env variables
}

variable "vpc_cidr" {
  description = "Main VPC CIDR definition"
  type        = string
  default     = "10.0.10.0/24"
}

variable "vpc_dns" {
  description = "Enable DNS support for VPC"
  type        = bool
  default     = true
}

resource "aws_vpc" "vpc" {

  cidr_block         = var.vpc_cidr # to the internet
  enable_dns_support = var.vpc_dns

  tags = {
    "owner" : "admin_user"
  }
}

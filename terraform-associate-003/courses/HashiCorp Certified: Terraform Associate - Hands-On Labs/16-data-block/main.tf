terraform {
  required_version = ">= 1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5"
    }
  }
}

provider "aws" {}

# Task 1: Get aws region
data "aws_region" "current" {}

locals {
  instance_name = "my_instance"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "instance" {
  instance_type = "t2.nano"
  ami           = data.aws_ami.ubuntu.id

  tags = {
    name = local.instance_name
    # Task 2: Add region to your resources
    # Didn't know where to use, so I put it in the tags list
    region = data.aws_region.current.id
  }
}

# Task 3: view availability zones
data "aws_availability_zones" "available" {
  state = "available"
}

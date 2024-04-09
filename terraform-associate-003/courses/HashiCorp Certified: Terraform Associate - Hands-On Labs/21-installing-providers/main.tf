terraform {
  required_version = ">= 1.0"
  required_providers {
    /*
    Task 1:
      - Add terraform provider for installation
      - Install it through `terraform init`
    */
    aws = {
      source  = "hashicorp/aws"
      version = "5.44"
    }
  }
}

# Task 2: Verify provider installation using `terraform -version`

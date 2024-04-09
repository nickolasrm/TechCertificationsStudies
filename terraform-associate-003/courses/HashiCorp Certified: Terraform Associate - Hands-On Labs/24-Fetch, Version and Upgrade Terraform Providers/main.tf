/*
Fetch, Version and Upgrade Terraform Providers

- Task 1: Check Terraform and Provider version
- Task 2: Require specific versions of Terraform providers
- Task 3: Upgrade provider versions
*/

terraform {
  required_version = ">= 1.0"
  required_providers {
    # Task 2.1: Adding providers
    http = {
      source  = "hashicorp/http"
      version = "3.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1"
    }
    local = {
      source = "hashicorp/local"
      # Task 2.2: Was 2.1, changed, then ran `terraform init -upgrade`
      version = "2.5"
    }
  }
}


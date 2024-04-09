terraform {
  required_version = ">= 1.0.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
  }
}

data "local_file" "user" {
  filename = "./name.txt"
}

# Task 1: Export resource attribute as output (it was a data block, but it is similar)
output "user" {
  value       = data.local_file.user.content
  description = "The user name"
}

# Task 2: Export dynamic meaningful values
output "hellouser" {
  value       = "Hello, ${data.local_file.user.content}"
  description = "Adds Hello to the user name"
}

# Task 3: `terraform output -json`

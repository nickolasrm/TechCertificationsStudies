terraform {
  required_version = ">= 1.0"
  required_providers {
    # Task 1: Install HTTP provider
    http = {
      source  = "hashicorp/http"
      version = ">=3.4,<4"
    }
    # Task 3: Install Random provider
    random = {
      source  = "hashicorp/random"
      version = ">=3.6,<4"
    }
    # Task 5: Install Local provider
    local = {
      source  = "hashicorp/local"
      version = ">=2.5,<3"
    }
  }
}

# Task 2: Configure http provider
provider "http" {

}

# Task 4: Configure random provider
provider "random" {
}

/*
Generate SSH Key with Terraform TLS Provider

- Task 1: Check Terraform
- Task 2: Install Terraform TLS Provider
- Task 3: Creates a self-signed certificate with TLS Provider
*/

terraform {
  required_version = ">= 1.0"
  required_providers {
    # Task 2: Add TLS provider and run `terraform init`
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.5"
    }
  }
}

# Task 3.1: Creating PEM file
resource "tls_private_key" "ssh_private_key" {
  algorithm = "RSA"
}

# Task 3.2: Creating self signed cert
resource "tls_self_signed_cert" "ssh_tls_self_signed" {
  private_key_pem = resource.tls_private_key.ssh_private_key.private_key_pem

  subject {
    common_name  = "mymyselfandi.com"
    organization = "Me Myself and I"
  }

  validity_period_hours = 12

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}

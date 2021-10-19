terraform {
  required_version = "0.14.3"
  backend "local" {
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
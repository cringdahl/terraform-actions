terraform {
  backend "s3" {
    region = "us-east-2"
    key    = "terraformstatefile-actions-test"
    bucket = "rackspace-undercloud-terraform"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.24.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
  default_tags {
    tags = {
      application  = "undercloud"
      environment  = "test"
      tag-std      = "v1.0"
      appid-or-sso = "cory2388"
    }
  }
}
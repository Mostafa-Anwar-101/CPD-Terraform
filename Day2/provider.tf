terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  alias  = "us_east"
}

provider "aws" {
  region = "eu-central-1"
  alias  = "eu_central"
}

locals {
  current_region = terraform.workspace == "prod" ? "eu-central-1" : "us-east-1"
}

provider "aws" {
  region = local.current_region
}


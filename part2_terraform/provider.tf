terraform {
  required_version = "= 1.1.8"

  required_providers {
    aws = {
      version = "~> 3.0"

    }
  }
}

provider "aws" {
  region  = var.aws_region
}

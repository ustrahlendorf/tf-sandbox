terraform {
required_version = ">=0.15.0"
  required_providers {
    aws = {
      version = "3.37.0"
    }
    template = {
      version = "2.2.0"
    }
  }
  backend "s3" {
      bucket = "ipta-dev-tf-state-store"
      key    = "dev/tf-state-0025.tfstate"
      region = "eu-central-1"
  }
}

provider "aws" {
  region  = "eu-central-1"
}

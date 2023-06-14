terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.20.1"
    }
  }
  //create backend remote storage and remote statefile locking
  backend "S3" {
    description    = "terraform Remote state locking"
    bucket         = "my_bucket"
    key            = "mywebapp/terrform.tfstate"
    region         = var.S3_REGION
    dynamodb_table = var.DYN_DB_TABLE_NAME
  }
}

provider "aws" {
  region     = var.AWS_REGION
  access_key = var.aws_access_key
  secret_key = var.aws_secret_access_key
}

module "my_vpc" {
  source = "modules/vpc"
  cidr   = "default"
  az     = "default"
}
module "my_sg" {
  source = "modules/securitygroups"
}
module "my_ec2" {
  source    = "modules/instances"
  ec2_count = var.ec2_count_main
}
module "my_ig" {
  source = "modules/internetgateway"
}
module "my_routtable" {
  source = "modules/routetables"
}

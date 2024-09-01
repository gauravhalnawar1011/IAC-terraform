# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 4.67"      
     }
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "dev-terraform-state-20240901-abcdef123456"
    key    = "remote-state/vpc/terraform.tfstate"
    region = "us-east-2" 
  
  }  
}

# Terraform Provider Block
provider "aws" {
  region = var.aws_region
}
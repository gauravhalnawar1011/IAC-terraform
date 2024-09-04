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
    bucket = "my-terraform" //Your bAckedn bucket
    key    = "my/ekscluster/terraform.tfstate"
    region = "ap-south-1" 
 
    # For State Locking
    dynamodb_table = "equip9-ekscluster"    
  }  
}

# Terraform Provider Block
provider "aws" {
  region = var.aws_region
}
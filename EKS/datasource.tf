data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "dev-terraform-state-20240901-abcdef123456"
    key    = "remote-state/vpc/terraform.tfstate"
    region = "us-east-2" 
  }
}


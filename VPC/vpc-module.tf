# AWS Availability Zones Datasource
data "aws_availability_zones" "available" {
}

# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"

  # VPC Basic Details
  name = var.vpc_name
  cidr = var.vpc_cidr_block
  azs             = data.aws_availability_zones.available.names
  public_subnets  = var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets  

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

#   # Additional Tags to Subnets
#   public_subnet_tags = {
#     Type = "Public Subnets"
#     "kubernetes.io/role/elb" = 1    
#     "kubernetes.io/cluster/${var.cluster_name}" = "owned"        
#   }
#   private_subnet_tags = {
#     Type = "Private Subnets"
#     "kubernetes.io/role/internal-elb" = 1    
#     "kubernetes.io/cluster/${var.cluster_name}" = "owned"    
#   }

  # Instances launched into the Public subnet should be assigned a public IP address.
  map_public_ip_on_launch = true
}

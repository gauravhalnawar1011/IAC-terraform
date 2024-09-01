# VPC Input Variables

# VPC Name
variable "vpc_name" {
  description = "VPC Name"
  type = string 
  default = "myproject-eks-vpc"
}

# VPC CIDR Block
variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type = string 
  default = "10.1.0.0/16"
}

# VPC Availability Zones
/*
variable "vpc_availability_zones" {
  description = "VPC Availability Zones"
  type = list(string)
  default = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}
*/

# VPC Public Subnets
variable "vpc_public_subnets" {
  description = "VPC Public Subnets"
  type = list(string)
  default = ["10.1.0.0/20", "10.1.16.0/20", "10.1.32.0/20"]
}

# VPC Private Subnets
variable "vpc_private_subnets" {
  description = "VPC Private Subnets"
  type = list(string)
  default = ["10.1.48.0/20", "10.1.64.0/20", "10.1.80.0/20"]
}


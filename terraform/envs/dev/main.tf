terraform {
  required_version = ">= 1.0"
}

provider "aws" {
  region = var.aws_region
}

module "eks_cluster" {
  source = "../../"  # Adjust to your root module path

  aws_region              = var.aws_region
  cluster_name            = var.cluster_name
  vpc_cidr                = var.vpc_cidr
  public_subnets_cidrs    = var.public_subnets_cidrs
  private_subnets_cidrs   = var.private_subnets_cidrs
  availability_zones      = var.availability_zones
  node_group_instance_types = var.node_group_instance_types
  node_group_desired      = var.node_group_desired
  node_group_min          = var.node_group_min
  node_group_max          = var.node_group_max
  cluster_version         = var.cluster_version
}

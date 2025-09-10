terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.40.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source                 = "./vpc"
  cluster_name           = var.cluster_name
  vpc_cidr               = var.vpc_cidr
  availability_zones     = var.availability_zones
  public_subnets_cidrs   = var.public_subnets_cidrs
  private_subnets_cidrs  = var.private_subnets_cidrs
}

module "iam" {
  source       = "./IAM"
  cluster_name = var.cluster_name
}

module "security_groups" {
  source       = "./security_groups"
  cluster_name = var.cluster_name
  vpc_id       = module.vpc.vpc_id
  vpc_cidr     = var.vpc_cidr
}

module "vpc_endpoints" {
  source             = "./vpc_endpoints"
  cluster_name       = var.cluster_name
  vpc_id             = module.vpc.vpc_id
  aws_region         = var.aws_region
  route_table_ids    = concat([module.vpc.public_route_table_id], [module.vpc.private_route_table_id]) # Adjust if you output these properly in vpc outputs
  private_subnet_ids  = module.vpc.private_subnet_ids
  vpc_cidr           = var.vpc_cidr
}

module "eks_private_cluster" {
  source = "./Eks-pvt-cluster-terraform-module"

  aws_region               = var.aws_region
  cluster_name             = var.cluster_name
  cluster_version          = var.cluster_version
  private_subnet_ids       = module.vpc.private_subnet_ids
  node_group_instance_types = var.node_group_instance_types
  node_group_desired       = var.node_group_desired
  node_group_min           = var.node_group_min
  node_group_max           = var.node_group_max
}

output "eks_endpoint" {
  value = module.eks_private_cluster.cluster_endpoint
}

output "eks_cluster_ca" {
  value = module.eks_private_cluster.cluster_certificate_authority_data
}

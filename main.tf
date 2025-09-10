module "vpc" {
  source               = "./modules/vpc"
  cluster_name         = var.cluster_name
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnets_cidrs = var.public_subnets_cidrs
  private_subnets_cidrs = var.private_subnets_cidrs

  public_route_cidr     = var.public_route_cidr     # add this
  private_route_cidr    = var.private_route_cidr    # add this
  enable_dns_hostnames  = var.enable_dns_hostnames  # add this
  enable_dns_support    = var.enable_dns_support    # add this
}


module "iam" {
  source               = "./modules/iam"
  cluster_name         = var.cluster_name
  eks_cluster_policies = var.eks_cluster_policies
  eks_node_policies    = var.eks_node_policies
}

module "security_groups" {
  source = "./modules/security_groups"
  cluster_name = var.cluster_name
  vpc_id       = module.vpc.vpc_id

  egress_protocol       = var.egress_protocol_sg
  egress_from_port      = var.egress_from_port_sg
  egress_to_port        = var.egress_to_port_sg
  egress_cidr_blocks    = var.egress_cidr_blocks_sg

  ingress_cp_protocol     = var.ingress_cp_protocol_sg
  ingress_cp_from_port    = var.ingress_cp_from_port_sg
  ingress_cp_to_port      = var.ingress_cp_to_port_sg
  ingress_cp_cidr_blocks  = var.ingress_cp_cidr_blocks_sg
  ingress_cp_description  = var.ingress_cp_description_sg

  ingress_self_protocol   = var.ingress_self_protocol_sg
  ingress_self_from_port  = var.ingress_self_from_port_sg
  ingress_self_to_port    = var.ingress_self_to_port_sg
  ingress_self_description= var.ingress_self_description_sg
  ingress_self_self       = var.ingress_self_self_sg

  sg_name        = var.sg_name
  sg_description = var.sg_description
}



module "vpc_endpoints" {
  source                     = "./modules/vpc_endpoints"
  cluster_name               = var.cluster_name
  aws_region                 = var.aws_region
  vpc_id                     = module.vpc.vpc_id
  route_table_ids            = concat(module.vpc.public_route_table_ids, module.vpc.private_route_table_ids)
  private_subnet_ids         = module.vpc.private_subnet_ids
  vpc_cidr                   = var.vpc_cidr

  s3_service_name            = var.s3_service_name
  s3_vpc_endpoint_type       = var.s3_vpc_endpoint_type
  interface_endpoints        = var.interface_endpoints
  interface_vpc_endpoint_type = var.interface_vpc_endpoint_type
  private_dns_enabled        = var.private_dns_enabled

  endpoints_sg_name          = var.endpoints_sg_name
  endpoints_sg_description   = var.endpoints_sg_description
  ingress_from_port          = var.ingress_from_port
  ingress_to_port            = var.ingress_to_port
  ingress_protocol           = var.ingress_protocol
  ingress_cidr_blocks        = var.ingress_cidr_blocks
  egress_from_port           = var.egress_from_port
  egress_to_port             = var.egress_to_port
  egress_protocol            = var.egress_protocol
  egress_cidr_blocks         = var.egress_cidr_blocks

  tags                       = var.tags
}

module "eks_private_cluster" {
  source                    = "./modules/eks"
  aws_region                = var.aws_region
  cluster_name              = var.cluster_name
  cluster_version           = var.cluster_version

  private_subnet_ids        = module.vpc.private_subnet_ids
  node_group_instance_types = var.node_group_instance_types
  node_group_desired        = var.node_group_desired
  node_group_min            = var.node_group_min
  node_group_max            = var.node_group_max

  ec2_ssh_key               = var.ec2_ssh_key
  ami_type                  = var.ami_type
  node_group_tags           = var.node_group_tags

  eks_cluster_role_arn      = module.iam.eks_cluster_role_arn
  node_group_role_arn       = module.iam.node_group_role_arn

  endpoint_private_access   = var.endpoint_private_access
  endpoint_public_access    = var.endpoint_public_access
  public_access_cidrs       = var.public_access_cidrs

  enabled_cluster_log_types = var.enabled_cluster_log_types
  tags                      = var.tags
}

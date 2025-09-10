# General Configuration
aws_region            = "us-west-2"
cluster_name          = "prince-private-eks-cluster"
vpc_cidr              = "10.10.0.0/16"
public_subnets_cidrs  = ["10.10.1.0/24", "10.10.2.0/24"]
private_subnets_cidrs = ["10.10.11.0/24", "10.10.12.0/24"]
availability_zones    = ["us-west-2a", "us-west-2b"]

# DNS Configuration for VPC
enable_dns_hostnames = true
enable_dns_support   = true

# Routes
public_route_cidr  = "0.0.0.0/0"
private_route_cidr = "0.0.0.0/0"

# Node Group Configuration
node_group_instance_types = ["t2.medium"]
node_group_desired        = 2
node_group_min            = 1
node_group_max            = 3

# EKS Configuration
cluster_version = "1.28"

# IAM policies (informational; defined in IAM module)
eks_cluster_policies = [
  "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
  "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
]

eks_node_policies = [
  "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
  "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
  "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
  "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
]

# Endpoint Access
endpoint_private_access = true
endpoint_public_access  = false
public_access_cidrs     = []

# Cluster Logging
enabled_cluster_log_types = ["api", "audit", "authenticator"]

# Tags
tags = {
  Name = "prince-private-eks-cluster"
}

# EC2 SSH key for node group access
ec2_ssh_key = "my-key-pair"  # Replace with your actual EC2 key pair name

# AMI type for nodes
ami_type = "AL2_x86_64"

# Node group tags
node_group_tags = {
  Name = "prince-private-eks-cluster-managed-node"
}

# Security Group configuration (updated with _sg suffix)
sg_name                  = "prince-private-eks-cluster-workers-sg"
sg_description           = "Security group for EKS worker nodes"

egress_protocol_sg       = "-1"
egress_from_port_sg      = 0
egress_to_port_sg        = 0
egress_cidr_blocks_sg    = ["0.0.0.0/0"]

ingress_cp_protocol_sg   = "tcp"
ingress_cp_from_port_sg  = 443
ingress_cp_to_port_sg    = 443
ingress_cp_cidr_blocks_sg = ["10.10.0.0/16"]
ingress_cp_description_sg = "Allow nodes to reach control plane"

ingress_self_protocol_sg = "-1"
ingress_self_from_port_sg = 0
ingress_self_to_port_sg   = 0
ingress_self_self_sg     = true
ingress_self_description_sg = "Allow intra-node communication"

# VPC Endpoint Configuration
s3_service_name      = "s3"
s3_vpc_endpoint_type = "Gateway"

interface_endpoints = [
  "ecr.api",
  "ecr.dkr",
  "sts",
  "logs",
  "ec2"
]

endpoints_sg_name        = "prince-private-eks-cluster-endpoints-sg"
endpoints_sg_description = "Security group for interface endpoints"

ingress_from_port    = 443
ingress_to_port      = 443
ingress_protocol     = "tcp"
ingress_cidr_blocks  = ["10.10.0.0/16"]

egress_from_port     = 0
egress_to_port       = 0
egress_protocol      = "-1"
egress_cidr_blocks   = ["0.0.0.0/0"]

interface_vpc_endpoint_type = "Interface"
private_dns_enabled          = true

# General Configuration
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-west-2"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "prince-private-eks-cluster"
}

# VPC Configuration
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b"]
}

variable "public_subnets_cidrs" {
  description = "List of CIDRs for public subnets"
  type        = list(string)
  default     = ["10.10.1.0/24", "10.10.2.0/24"]
}

variable "private_subnets_cidrs" {
  description = "List of CIDRs for private subnets"
  type        = list(string)
  default     = ["10.10.11.0/24", "10.10.12.0/24"]
}

# IAM Policies
variable "eks_cluster_policies" {
  description = "List of IAM policy ARNs for EKS cluster role"
  type        = list(string)
}

variable "eks_node_policies" {
  description = "List of IAM policy ARNs for EKS node group role"
  type        = list(string)
}

# Node Group Configuration
variable "node_group_instance_types" {
  description = "Instance types for EKS nodes"
  type        = list(string)
  default     = ["t2.medium"]
}

variable "node_group_desired" {
  description = "Desired size of EKS node group"
  type        = number
  default     = 2
}

variable "node_group_min" {
  description = "Minimum size of EKS node group"
  type        = number
  default     = 1
}

variable "node_group_max" {
  description = "Maximum size of EKS node group"
  type        = number
  default     = 3
}

variable "ec2_ssh_key" {
  description = "EC2 SSH key pair name for EKS node access"
  type        = string
}

variable "ami_type" {
  description = "AMI type for EKS node group"
  type        = string
}

variable "node_group_tags" {
  description = "Tags for EKS managed node group"
  type        = map(string)
}

# EKS Configuration
variable "cluster_version" {
  description = "Kubernetes version for EKS cluster"
  type        = string
  default     = "1.28"
}

variable "endpoint_private_access" {
  description = "Enable private access to the EKS endpoint"
  type        = bool
}

variable "endpoint_public_access" {
  description = "Enable public access to the EKS endpoint"
  type        = bool
}

variable "public_access_cidrs" {
  description = "List of CIDRs allowed for public access"
  type        = list(string)
}

variable "enabled_cluster_log_types" {
  description = "List of enabled EKS control plane logs"
  type        = list(string)
}

# Tags
variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
}

# VPC Endpoint Configuration
variable "s3_service_name" {
  description = "Name of the S3 service for Gateway endpoint"
  type        = string
}

variable "s3_vpc_endpoint_type" {
  description = "Type of VPC endpoint for S3 (Gateway)"
  type        = string
}

variable "interface_endpoints" {
  description = "List of interface endpoints to create"
  type        = list(string)
}

variable "interface_vpc_endpoint_type" {
  description = "Type for interface VPC endpoints"
  type        = string
}

variable "private_dns_enabled" {
  description = "Enable private DNS for interface endpoints"
  type        = bool
}

# Interface Endpoint Security Group Configuration
variable "endpoints_sg_name" {
  description = "Name of the interface endpoint security group"
  type        = string
}

variable "endpoints_sg_description" {
  description = "Description of the interface endpoint security group"
  type        = string
}

variable "ingress_from_port" {
  description = "Ingress rule from port for interface endpoints SG"
  type        = number
}

variable "ingress_to_port" {
  description = "Ingress rule to port for interface endpoints SG"
  type        = number
}

variable "ingress_protocol" {
  description = "Ingress rule protocol for interface endpoints SG"
  type        = string
}

variable "ingress_cidr_blocks" {
  description = "CIDR blocks for ingress to interface endpoints SG"
  type        = list(string)
}

variable "egress_from_port" {
  description = "Egress rule from port for interface endpoints SG"
  type        = number
}

variable "egress_to_port" {
  description = "Egress rule to port for interface endpoints SG"
  type        = number
}

variable "egress_protocol" {
  description = "Egress rule protocol for interface endpoints SG"
  type        = string
}

variable "egress_cidr_blocks" {
  description = "CIDR blocks for egress from interface endpoints SG"
  type        = list(string)
}

# VPC Routing
variable "public_route_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "private_route_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "enable_dns_support" {
  type    = bool
  default = true
}

# Security Groups Module Variables (needed to fix errors)
variable "egress_protocol_sg" {
  description = "Egress rule protocol for worker nodes SG"
  type        = string
  default     = "tcp"
}

variable "egress_from_port_sg" {
  description = "Egress rule from port for worker nodes SG"
  type        = number
  default     = 0
}

variable "egress_to_port_sg" {
  description = "Egress rule to port for worker nodes SG"
  type        = number
  default     = 0
}

variable "egress_cidr_blocks_sg" {
  description = "Egress CIDR blocks for worker nodes SG"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ingress_cp_protocol_sg" {
  description = "Ingress control plane protocol for worker nodes SG"
  type        = string
  default     = "tcp"
}

variable "ingress_cp_from_port_sg" {
  description = "Ingress control plane from port for worker nodes SG"
  type        = number
  default     = 443
}

variable "ingress_cp_to_port_sg" {
  description = "Ingress control plane to port for worker nodes SG"
  type        = number
  default     = 443
}

variable "ingress_cp_cidr_blocks_sg" {
  description = "Ingress control plane CIDR blocks for worker nodes SG"
  type        = list(string)
  default     = ["10.10.0.0/16"]
}

variable "ingress_cp_description_sg" {
  description = "Ingress control plane description for worker nodes SG"
  type        = string
  default     = "Ingress for control plane"
}

variable "ingress_self_protocol_sg" {
  description = "Ingress self protocol for worker nodes SG"
  type        = string
  default     = "tcp"
}

variable "ingress_self_from_port_sg" {
  description = "Ingress self from port for worker nodes SG"
  type        = number
  default     = 1025
}

variable "ingress_self_to_port_sg" {
  description = "Ingress self to port for worker nodes SG"
  type        = number
  default     = 65535
}

variable "ingress_self_description_sg" {
  description = "Ingress self description for worker nodes SG"
  type        = string
  default     = "Self ingress"
}

variable "ingress_self_self_sg" {
  description = "Ingress self to self for worker nodes SG"
  type        = bool
  default     = true
}

variable "sg_name" {
  description = "Security group name"
  type        = string
  default     = "worker-sg"
}

variable "sg_description" {
  description = "Security group description"
  type        = string
  default     = "Security group for worker nodes"
}

variable "aws_region" {
  type        = string
  description = "AWS region to deploy resources"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name prefix"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnets_cidrs" {
  type        = list(string)
  description = "CIDR blocks for public subnets"
}

variable "private_subnets_cidrs" {
  type        = list(string)
  description = "CIDR blocks for private subnets"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of AZs to use; empty means automatic selection"
}

variable "node_group_instance_types" {
  type        = list(string)
  description = "EC2 instance types for EKS worker nodes"
}

variable "node_group_desired" {
  type        = number
  description = "Desired number of nodes in the EKS node group"
}

variable "node_group_min" {
  type        = number
  description = "Minimum number of nodes in the EKS node group"
}

variable "node_group_max" {
  type        = number
  description = "Maximum number of nodes in the EKS node group"
}

variable "cluster_version" {
  type        = string
  description = "EKS Kubernetes version"
}

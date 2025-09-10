variable "aws_region" {
  type    = string
  default = "us-west-2" # Change as needed
  description = "AWS region to deploy resources"
}

variable "cluster_name" {
  type    = string
  default = "prince-private-eks-cluster"
  description = "EKS cluster name prefix"
}

variable "vpc_cidr" {
  type    = string
  default = "10.10.0.0/16"
  description = "CIDR block for the VPC"
}

variable "public_subnets_cidrs" {
  type    = list(string)
  default = ["10.10.1.0/24", "10.10.2.0/24"]
  description = "CIDR blocks for public subnets"
}

variable "private_subnets_cidrs" {
  type    = list(string)
  default = ["10.10.11.0/24", "10.10.12.0/24"]
  description = "CIDR blocks for private subnets"
}

variable "availability_zones" {
  type        = list(string)
  default     = [] # auto-pick from data source if empty
  description = "List of AZs to use; empty means automatic selection"
}

variable "node_group_instance_types" {
  type        = list(string)
  default     = ["t2.medium"]
  description = "EC2 instance types for EKS worker nodes"
}

variable "node_group_desired" {
  type        = number
  default     = 2
  description = "Desired number of nodes in the EKS node group"
}

variable "node_group_min" {
  type        = number
  default     = 1
  description = "Minimum number of nodes in the EKS node group"
}

variable "node_group_max" {
  type        = number
  default     = 3
  description = "Maximum number of nodes in the EKS node group"
}

variable "cluster_version" {
  type        = string
  default     = "1.28"
  description = "EKS Kubernetes version"
}

variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
  default     = "prince-private-eks-cluster"
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes version for the EKS cluster"
  default     = "1.28"
}

variable "aws_region" {
  type        = string
  description = "AWS region to deploy the EKS cluster"
  default     = "us-west-2"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for EKS cluster and node groups"
  default     = []
}

variable "node_group_desired" {
  type        = number
  description = "Desired number of nodes in the EKS worker node group"
  default     = 2
}

variable "node_group_min" {
  type        = number
  description = "Minimum number of nodes in the EKS worker node group"
  default     = 1
}

variable "node_group_max" {
  type        = number
  description = "Maximum number of nodes in the EKS worker node group"
  default     = 3
}

variable "node_group_instance_types" {
  type        = list(string)
  description = "EC2 instance types for the EKS worker nodes"
  default     = ["t2.medium"]
}

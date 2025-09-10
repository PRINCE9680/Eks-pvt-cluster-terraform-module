variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "cluster_version" {
  type        = string
  description = "EKS Kubernetes version"
  default     = "1.28"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for the EKS cluster"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "node_group_desired" {
  type        = number
  description = "Desired number of nodes in node group"
}

variable "node_group_min" {
  type        = number
  description = "Minimum number of nodes in node group"
}

variable "node_group_max" {
  type        = number
  description = "Maximum number of nodes in node group"
}

variable "node_group_instance_types" {
  type        = list(string)
  description = "Instance types for node group"
}

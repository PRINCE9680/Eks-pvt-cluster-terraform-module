variable "cluster_name" {
  type        = string
  description = "Cluster name for tagging"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where security group is created"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block for ingress rule"
}

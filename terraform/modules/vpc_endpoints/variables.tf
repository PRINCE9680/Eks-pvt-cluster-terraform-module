variable "cluster_name" {
  type        = string
  description = "Cluster name prefix for tagging"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where endpoints will be created"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "route_table_ids" {
  type        = list(string)
  description = "List of route table IDs to associate with gateway endpoints"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for interface endpoints"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block for security group ingress"
}

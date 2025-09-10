variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster to tag resources"
}

variable "public_subnets_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for public subnets"
}

variable "private_subnets_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for private subnets"
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability zones to use (empty for auto selection)"
  default     = []
}

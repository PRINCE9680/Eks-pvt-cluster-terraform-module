variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster to tag resources"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
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

variable "public_route_cidr" {
  type        = string
  description = "CIDR block for the public route (usually 0.0.0.0/0)"
}

variable "private_route_cidr" {
  type        = string
  description = "CIDR block for the private route (usually 0.0.0.0/0)"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in the VPC"
}

variable "enable_dns_support" {
  type        = bool
  description = "Enable DNS support in the VPC"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all VPC resources"
  default     = {}
}

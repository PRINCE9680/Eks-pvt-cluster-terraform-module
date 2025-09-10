variable "cluster_name" {
  type        = string
  description = "Cluster name prefix for tagging"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where endpoints will be created"
}

variable "route_table_ids" {
  type        = list(string)
  description = "Route table IDs for the S3 gateway endpoint"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs for the interface endpoints"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block for security group ingress"
}

# ✅ S3 endpoint config
variable "s3_service_name" {
  type        = string
  description = "Service name for the S3 gateway endpoint (e.g., 's3')"
}

variable "s3_vpc_endpoint_type" {
  type        = string
  description = "Type of S3 VPC endpoint (e.g., 'Gateway')"
}

# ✅ Interface endpoints
variable "interface_endpoints" {
  type        = list(string)
  description = "List of AWS interface services to enable"
}

variable "interface_vpc_endpoint_type" {
  type        = string
  description = "Type of interface VPC endpoint (usually 'Interface')"
}

variable "private_dns_enabled" {
  type        = bool
  description = "Enable private DNS for interface endpoints"
}

# ✅ Security group config
variable "endpoints_sg_name" {
  type        = string
  description = "Name of the security group for interface endpoints"
}

variable "endpoints_sg_description" {
  type        = string
  description = "Description of the endpoints security group"
}

variable "ingress_from_port" {
  type        = number
  description = "Ingress from port for endpoints SG"
}

variable "ingress_to_port" {
  type        = number
  description = "Ingress to port for endpoints SG"
}

variable "ingress_protocol" {
  type        = string
  description = "Ingress protocol for endpoints SG"
}

variable "ingress_cidr_blocks" {
  type        = list(string)
  description = "Ingress CIDR blocks for endpoints SG"
}

variable "egress_from_port" {
  type        = number
  description = "Egress from port for endpoints SG"
}

variable "egress_to_port" {
  type        = number
  description = "Egress to port for endpoints SG"
}

variable "egress_protocol" {
  type        = string
  description = "Egress protocol for endpoints SG"
}

variable "egress_cidr_blocks" {
  type        = list(string)
  description = "Egress CIDR blocks for endpoints SG"
}

# ✅ Global Tags
variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default     = {}
}

variable "cluster_name" {
  type        = string
  description = "Cluster name for context"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where security group is created"
}

variable "sg_name" {
  type        = string
  description = "Name of the security group"
}

variable "sg_description" {
  type        = string
  description = "Description for the security group"
}

# Ingress - Self
variable "ingress_self_from_port" {
  type        = number
  description = "From port for self-ingress rule"
}
variable "ingress_self_to_port" {
  type        = number
  description = "To port for self-ingress rule"
}
variable "ingress_self_protocol" {
  type        = string
  description = "Protocol for self-ingress rule"
}
variable "ingress_self_self" {
  type        = bool
  description = "Whether the self-ingress rule is self-referencing"
}
variable "ingress_self_description" {
  type        = string
  description = "Description for self-ingress rule"
}

# Ingress - Control Plane
variable "ingress_cp_from_port" {
  type        = number
  description = "From port for control plane ingress"
}
variable "ingress_cp_to_port" {
  type        = number
  description = "To port for control plane ingress"
}
variable "ingress_cp_protocol" {
  type        = string
  description = "Protocol for control plane ingress"
}
variable "ingress_cp_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks for control plane ingress"
}
variable "ingress_cp_description" {
  type        = string
  description = "Description for control plane ingress rule"
}

# Egress
variable "egress_from_port" {
  type        = number
  description = "From port for egress"
}
variable "egress_to_port" {
  type        = number
  description = "To port for egress"
}
variable "egress_protocol" {
  type        = string
  description = "Protocol for egress"
}
variable "egress_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks for egress rule"
}

# Tags
variable "tags" {
  type        = map(string)
  description = "Tags for the security group"
  default     = {}
}
